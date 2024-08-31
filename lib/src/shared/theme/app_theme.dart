import 'package:flutter/material.dart';
import 'package:vrindavantiffin/src/shared/color/app_color.dart';

class AppThemes {
  const AppThemes._();

  static final themeLight = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      surface: AppColors.surfaceLight,
      background: AppColors.backgroundLight,
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    dividerTheme: DividerThemeData(color: AppColors.dividerColorLight),

    /// Old theme
    /*textTheme: GoogleFonts.poppinsTextTheme(const TextTheme())*/
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: 'TepenoSans'),
      bodyMedium: TextStyle(fontFamily: 'TepenoSans'),
      displayLarge: TextStyle(fontFamily: 'TepenoSans'),
      displayMedium: TextStyle(fontFamily: 'TepenoSans'),
      displaySmall: TextStyle(fontFamily: 'TepenoSans'),
      headlineMedium: TextStyle(fontFamily: 'TepenoSans'),
      headlineSmall: TextStyle(fontFamily: 'TepenoSans'),
      titleLarge: TextStyle(fontFamily: 'TepenoSans'),
      titleMedium: TextStyle(fontFamily: 'TepenoSans'),
      titleSmall: TextStyle(fontFamily: 'TepenoSans'),
      bodySmall: TextStyle(fontFamily: 'TepenoSans'),
      labelLarge: TextStyle(fontFamily: 'TepenoSans'),
      labelSmall: TextStyle(fontFamily: 'TepenoSans'),
    ),
  );
  static final themeDark = ThemeData(
    colorScheme: ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        surface: AppColors.surfaceDark,
        background: AppColors.backgroundDark),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    dividerTheme: DividerThemeData(color: AppColors.dividerColorDark),
    /*textTheme: GoogleFonts.poppinsTextTheme(const TextTheme())*/
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: 'TepenoSans'),
      bodyMedium: TextStyle(fontFamily: 'TepenoSans'),
      displayLarge: TextStyle(fontFamily: 'TepenoSans'),
      displayMedium: TextStyle(fontFamily: 'TepenoSans'),
      displaySmall: TextStyle(fontFamily: 'TepenoSans'),
      headlineMedium: TextStyle(fontFamily: 'TepenoSans'),
      headlineSmall: TextStyle(fontFamily: 'TepenoSans'),
      titleLarge: TextStyle(fontFamily: 'TepenoSans'),
      titleMedium: TextStyle(fontFamily: 'TepenoSans'),
      titleSmall: TextStyle(fontFamily: 'TepenoSans'),
      bodySmall: TextStyle(fontFamily: 'TepenoSans'),
      labelLarge: TextStyle(fontFamily: 'TepenoSans'),
      labelSmall: TextStyle(fontFamily: 'TepenoSans'),
    ),
  );
}