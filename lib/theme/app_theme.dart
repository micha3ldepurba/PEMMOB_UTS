import 'package:flutter/material.dart';

class AppTheme {
  static final MaterialColor baseColor = MaterialColor(0xFF6F4E37, {
    50: const Color(0xFFF3EDE9),
    100: const Color(0xFFE1D0C1),
    200: const Color(0xFFCEB298),
    300: const Color(0xFFBA946F),
    400: const Color(0xFFA9784E),
    500: const Color(0xFF6F4E37),
    600: const Color(0xFF624531),
    700: const Color(0xFF543B2A),
    800: const Color(0xFF463124),
    900: const Color(0xFF38271E),
  });

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: baseColor[500]!,
      secondary: baseColor[200]!,
    ),
    scaffoldBackgroundColor: Colors.brown[50],
    appBarTheme: AppBarTheme(backgroundColor: baseColor[500]),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: baseColor[400]),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: baseColor[700]!,
      secondary: baseColor[400]!,
    ),
    scaffoldBackgroundColor: Colors.brown[900],
    appBarTheme: AppBarTheme(backgroundColor: baseColor[700]),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: baseColor[500]),
    ),
  );
}
