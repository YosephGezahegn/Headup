import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/game_provider.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: const RasBeRasApp(),
    ),
  );
}

class RasBeRasApp extends StatelessWidget {
  const RasBeRasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ራስ በራስ', // Ras Be Ras
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
