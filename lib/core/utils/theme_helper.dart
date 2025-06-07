import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class ThemeHelper {
  // Check if system is in dark mode
  static bool isSystemDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  // Check if current theme is dark
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Get opposite brightness
  static Brightness getOppositeBrightness(BuildContext context) {
    return isDarkMode(context) ? Brightness.light : Brightness.dark;
  }

  // Create theme data for light mode
  static ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColors.backGroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkBrown),
        bodyMedium: TextStyle(color: AppColors.darkBrown),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.textFieldFillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Create theme data for dark mode
  static ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColors.darkBackGroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkPrimaryBlue,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.darkTextFieldFillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
