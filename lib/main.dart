import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CoffeeQuizApp());
}

class CoffeeQuizApp extends StatefulWidget {
  const CoffeeQuizApp({super.key});

  @override
  State<CoffeeQuizApp> createState() => _CoffeeQuizAppState();
}

class _CoffeeQuizAppState extends State<CoffeeQuizApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Coffee Quiz ☕",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(toggleTheme: toggleTheme, isDarkMode: isDarkMode),
    );
  }
}
