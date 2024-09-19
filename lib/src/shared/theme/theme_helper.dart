import 'package:flutter/material.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';


String _appTheme = "lightCode";

LightCodeColors get appTheme => LightCodeColors();

ThemeData get theme => ThemeHelper().themeData();



/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the LightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    var appTheme = LightCodeColors();
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray100,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appTheme.gray200,
      ),
      dividerTheme: DividerThemeData(
        thickness: 2,
        space: 2,
        color: appTheme.gray40001,
      ),
    );
  }

  /// Returns the LightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: colorScheme.primary.withOpacity(0.5),
      fontSize: 17.fsize,
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: colorScheme.primary,
      fontSize: 14.fsize,
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: colorScheme.primary,
      fontSize: 11.fsize,
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 36.fsize,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w800,
    ),
    headlineLarge: TextStyle(
      color: colorScheme.primary.withOpacity(0.8),
      fontSize: 32.fsize,
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: TextStyle(
      // color: appTheme.blue,
      fontSize: 27.fsize,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w800,
    ),
    headlineSmall: TextStyle(
      color: colorScheme.primary.withOpacity(0.8),
      fontSize: 24.fsize,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w800,
    ),
    labelLarge: TextStyle(
      color: colorScheme.onError,
      fontSize: 12.fsize,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      color: colorScheme.primary,
      fontSize: 11.fsize,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: colorScheme.onError,
      fontSize: 21.fsize,
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: colorScheme.primary.withOpacity(0.8),
      fontSize: 17.fsize,
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: colorScheme.primary.withOpacity(0.8),
      fontSize: 14.fsize,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    ),
  );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0xFF000000),
    primaryContainer: Color(0xFF0A191E),
    secondaryContainer: Color(0xFF575A89),
    errorContainer: Color(0xFFA8A8A8),
    onError: Color(0xFFFFFFFF),
    onPrimary: Color(0xFF2F2E41),
    onPrimaryContainer: Color(0xFF979797),
  );
}

/// Class containing custom colors for a LightCode theme.
class LightCodeColors {
  Color get amber300 => Color(0xFFFED253);
  Color get black900 => Color(0xFF010002);
  Color get blueGray100 => Color(0xFFCCCCCC);
  Color get blueGray800 => Color(0xFF444053);
  Color get blueGray80001 => Color(0xFF3F3056);
  Color get blueGray80002 => Color(0xFF2E3A59);
  Color get blueGray900 => Color(0xFF33313F);
  Color get blueGray90001 => Color(0xFF2D3748);
  Color get blueGray90002 => Color(0xFF333333);
  Color get blueGray90003 => Color(0xFF313131);
  Color get blueGray90004 => Color(0xFF203238);
  Color get deepOrange100 => Color(0xFFFFB8B8);
  Color get deepOrange10001 => Color(0xFFFBBEBE);
  Color get deepOrange200 => Color(0xFFF8C108);
  Color get gray100 => Color(0xFFF6F6F7);
  Color get gray10001 => Color(0xFFF2F2F2);
  Color get gray200 => Color(0xFFEBEBEB);
  Color get gray20001 => Color(0xFFE8EBEC);
  Color get gray20002 => Color(0xFFE7E7E7);
  Color get gray300 => Color(0xFFE9E9E6);
  Color get gray30001 => Color(0xFFE1E1E1);
  Color get gray400 => Color(0xFFC4C4C4);
  Color get gray40001 => Color(0xFFB3B3B3);
  Color get gray500 => Color(0xFFA0616A);
  Color get gray60001 => Color(0xFF6F6F6F);
  Color get gray700 => Color(0xFF5A5A5A);
  Color get lightGreen500 => Color(0xFF8CCF4D);
  Color get orange500 => Color(0xFF851308);
  Color get orangeA700 => Color(0xFF6A0B00);
  Color get orangeA70001 =>  Color(0xFF9E3D23);




  Color get redA200 => Color(0xFFFA5959);
  Color get yellow800 => Color(0xFFF9A825);
  Color get yellowA400 => Color(0xFFFAE312);
  Color get yellowA40001 => Color(0xFFFBE313);
}
