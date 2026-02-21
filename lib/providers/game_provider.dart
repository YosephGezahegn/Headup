import 'package:flutter/material.dart';
import '../models/category.dart';

class GameProvider with ChangeNotifier {
  List<GameCategory> _categories = List.from(defaultCategories);
  GameCategory? _selectedCategory;
  int _score = 0;
  int _timeLeft = 60;
  bool _isPlaying = false;
  
  List<GameCategory> get categories => _categories;
  GameCategory? get selectedCategory => _selectedCategory;
  int get score => _score;
  int get timeLeft => _timeLeft;
  bool get isPlaying => _isPlaying;

  void selectCategory(GameCategory category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void addCategory(GameCategory category) {
    _categories.add(category);
    notifyListeners();
  }

  void startGame() {
    _score = 0;
    _timeLeft = 60;
    _isPlaying = true;
    notifyListeners();
  }

  void endGame() {
    _isPlaying = false;
    notifyListeners();
  }

  void incrementScore() {
    _score++;
    notifyListeners();
  }

  void updateTime(int seconds) {
    _timeLeft = seconds;
    notifyListeners();
  }
}
