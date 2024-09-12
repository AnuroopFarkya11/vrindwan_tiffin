import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/screen/admin/console/widget/feature_card.dart';
import 'package:vrindavantiffin/src/shared/color/app_color.dart';

class AppThemes {
  const AppThemes._();

  static final themeLight = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      surface: AppColors.backgroundLight,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
        fillColor: AppColors.surfaceLight,
        hintStyle: TextStyle(color: AppColors.secondaryTextColor,fontWeight: FontWeight.w100),

        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        )),
    dividerTheme: DividerThemeData(color: AppColors.dividerColorLight),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.surfaceLight,
        textStyle: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
        minimumSize: Size(160, 52)

      )
    ),

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