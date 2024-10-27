import 'package:flutter/material.dart';

class AppTheme {
  static const double xs = 8.0;
  static const double sm = 16.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 48.0;
  static const double xl2 = 64.0;
  static const double xl3 = 86.0;

  static const highlightDarkest = Color(0xFF006FFD);
  static const neutralLightest = Color(0xFFFFFFFF);
  static const neutralDarkest = Color(0xFFC5C6CC);

  static const textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
    headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: lg),
    bodyMedium: TextStyle(fontSize: md),
    bodySmall: TextStyle(fontSize: sm),
  );

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(primary: highlightDarkest, surface: neutralLightest),
    textTheme: textTheme,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: neutralDarkest, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: highlightDarkest, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: neutralDarkest, width: 2),
      ),
      filled: true,
      fillColor: neutralLightest,
      labelStyle: TextStyle(fontSize: md, color: neutralDarkest),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: highlightDarkest, // Primary color
        foregroundColor: neutralLightest,
        padding: EdgeInsets.symmetric(vertical: 16.0), // Vertical padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
      ),
    ),
    useMaterial3: true,
  );
}
