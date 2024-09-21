import 'package:flutter/material.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';


/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillOrangeA => ElevatedButton.styleFrom(
    backgroundColor: appTheme.orangeA70001,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillOrangeATL10 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.orangeA700,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillOrangeATL5 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.orangeA70001,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillOrangeATL51 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.orangeA700,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  // Outline button style
  static ButtonStyle get outlineOrangeA => OutlinedButton.styleFrom(
    backgroundColor: theme.colorScheme.onError,
    side: BorderSide(
      color: appTheme.orangeA70001,
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get outlineOrangeATL10 => OutlinedButton.styleFrom(
    backgroundColor: theme.colorScheme.onError,
    side: BorderSide(
      color: appTheme.orangeA700,
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    padding: EdgeInsets.zero,
  );

  // Text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
    side: MaterialStateProperty.all<BorderSide>(
      BorderSide(color: Colors.transparent),
    ),
  );
}
