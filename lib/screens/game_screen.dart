import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../theme/app_theme.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Timer? _timer;
  int _currentWordIndex = 0;
  late List<String> _shuffledWords;

  @override
  void initState() {
    super.initState();
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    _shuffledWords = List.from(gameProvider.selectedCategory?.words ?? [])..shuffle();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final gameProvider = Provider.of<GameProvider>(context, listen: false);
      if (gameProvider.timeLeft > 0) {
        gameProvider.updateTime(gameProvider.timeLeft - 1);
      } else {
        _timer?.cancel();
        _showGameOver();
      }
    });
  }

  void _nextWord(bool correct) {
    setState(() {
      if (correct) {
        Provider.of<GameProvider>(context, listen: false).incrementScore();
      }
      if (_currentWordIndex < _shuffledWords.length - 1) {
        _currentWordIndex++;
      } else {
        _shuffledWords.shuffle();
        _currentWordIndex = 0;
      }
    });
  }

  void _showGameOver() {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('ጊዜው ተጠናቋል!', textAlign: TextAlign.center),
        content: Text(
          'ያገኙት ነጥብ፡ ${gameProvider.score}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                gameProvider.updateTime(60);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('ወደ ዋናው ገጽ ተመለስ'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final currentWord = _shuffledWords.isNotEmpty ? _shuffledWords[_currentWordIndex] : "---";

    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: Stack(
        children: [
          // Close button
          Positioned(top: 40, left: 20, child: IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.black26,
              child: Icon(Icons.close, color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          )),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    gameProvider.selectedCategory?.amharicTitle.toUpperCase() ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.secondary),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  currentWord,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.secondary,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppTheme.secondary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.timer_outlined, color: AppTheme.primary, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        gameProvider.timeLeft.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 28,
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Action overlays from design
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildControlHint(Icons.arrow_upward, "ለማለፍ ወደ ላይ", "Tilt up to pass"),
                  _buildControlHint(Icons.arrow_downward, "ትክክል ሲሆን ወደ ታች", "Tilt down for correct"),
                ],
              ),
            ),
          ),
          
          // Interactive areas for Web testing (since no accelerometer)
          Positioned.fill(
            child: Row(
              children: [
                Expanded(child: GestureDetector(onTap: () => _nextWord(false))),
                Expanded(child: GestureDetector(onTap: () => _nextWord(true))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlHint(IconData icon, String amh, String eng) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.black38, size: 40),
        Text(amh, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        Text(eng, style: const TextStyle(fontSize: 10, color: Colors.black54)),
      ],
    );
  }
}
