import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF6B1A3B);
  static const primaryColorLight = Color(0xFFF0E8EB);

  // Couleurs texte
  static const textColor = Color(0xFF6B1A3B);
  static const textLightColor = Color(0xFF9E9E9E);

  // Thème clair

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Satoshi',
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      primaryContainer: primaryColorLight,

      // secondary: Color(0xFF59C1BD),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 26, 26, 26),
      ),

      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF465863),
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: primaryColor),
      titleTextStyle: TextStyle(
        fontFamily: 'Satoshi',
        color: primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
