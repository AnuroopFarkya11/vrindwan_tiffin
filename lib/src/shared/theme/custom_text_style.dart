import 'package:flutter/material.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';

import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';

extension on TextStyle {
  // This extension applies the Proxima Nova font family.
  TextStyle get proximaNova => copyWith(
        fontFamily: 'Proxima Nova',
      );

  // This extension applies the Roboto font family.
  TextStyle get roboto => copyWith(
        fontFamily: 'Roboto',
      );
}

class CustomTextStyle {
  static get onError => TextStyle(color: theme.colorScheme.onError);

// Body text style
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get bodyLargePrimary1 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );

  static get bodyLargeRoboto => theme.textTheme.bodyLarge!.roboto;

  static get bodyLargeRobotoOnError =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: theme.colorScheme.onError,
      );

  static get bodyLargeRobotoPrimary =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );

  static get bodyLargeRobotoPrimary1 =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: theme.colorScheme.primary,
      );

  static get bodyMediumBluegray80002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray80002.withOpacity(0.6),
      );

  static get bodyMediumBluegray800021 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray80002,
      );

  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );

  static get bodyMediumPrimary1 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.5),
      );

  static get bodyMediumPrimary2 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );

  static get bodyMediumPrimary3 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );

  static get bodyMediumPrimary4 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.5),
      );

  // Body text style
  static get bodyMediumRoboto1 => theme.textTheme.bodyMedium!.roboto;

  static get bodyMediumRoboto2 => theme.textTheme.bodyMedium!.roboto;

  static get bodyMedium1 => theme.textTheme.bodyMedium!;

  static get bodySmallBluegray80002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray80002,
      );

  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
        fontSize: 12.0, // Assuming 12.fSize should be 12.0
      );

  static get bodySmallRoboto => theme.textTheme.bodySmall!.roboto;

  static get bodySmallRobotoBluegray80002 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.blueGray80002,
      );

  static get bodySmallRobotoPrimary =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
        fontSize: 12.0, // Assuming 12.fSize should be 12.0
      );

  static get bodySmallRoboto1 => theme.textTheme.bodySmall!.roboto;

  static get bodySmallRoboto2 => theme.textTheme.bodySmall!.roboto;

// Display text style
  static get displaySmallProximaNovaPrimary =>
      theme.textTheme.displaySmall!.proximaNova.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );

  static get titleLargeRobotoPrimaryRegular =>
      theme.textTheme.titleLarge!.roboto.copyWith(
          fontWeight: FontWeight.w400,
          color: theme.colorScheme.primary.withOpacity(0.8));

  static get titleLargeBluegray80002 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray80002,
      );

  static get titleLargeBluegray90001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray90001,
      );

  static get titleLargeExtraBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w800,
      );

  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );

  static get titleLargePrimaryExtraBold => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w800,
      );

  static get titleLargePrimaryExtraBold1 =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
        fontWeight: FontWeight.w800,
      );

  static get titleLargePrimaryExtraBold2 =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.6),
        fontWeight: FontWeight.w800,
      );

  static get titleLargePrimaryRegular => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
        fontWeight: FontWeight.w400,
      );

  static get titleLargePrimaryRegular1 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
        fontWeight: FontWeight.w400,
      );

  static get titleLargePrimary1 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.6),
      );

  static get titleLargePrimary2 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get titleLargePrimary3 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );

  static get titleLargeRoboto => theme.textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w800,
      );

  static get titleLargeRobotoBluegray80002 =>
      theme.textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        color: appTheme.blueGray80002,
      );

  static get titleLargeRobotoBluegray90001 =>
      theme.textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        color: appTheme.blueGray90001.withOpacity(0.8),
      );

  static get titleLargeRobotoBluegray90001Regular =>
      theme.textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        color: appTheme.blueGray90001,
        fontWeight: FontWeight.w400,
      );

  static get titleLargeRobotoBluegray900011 =>
      theme.textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        color: appTheme.blueGray90001,
      );

  static get titleLargeRobotoOrangeA700 => theme.textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        color: appTheme.orangeA700,
        fontWeight: FontWeight.w800,
      );

  static get titleLargeRobotoOrangeA70001 =>
      theme.textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        color: appTheme.orangeA70001.withOpacity(0.8),
        fontWeight: FontWeight.w800,
      );

  static get titleLargeRobotoOrangeA7000120 =>
      theme.textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        color: appTheme.orangeA70001,
        fontSize: 20.fsize,
      );

  static get titleLargeRobotoOrangeA700011 =>
      theme.textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        color: appTheme.orangeA70001,
      );

  static get titleMediumRobotoOrangeA700 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.orangeA700,
      );

  static get titleMediumRobotoOrangeA70001 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.orangeA70001,
      );

  static get titleMediumRobotoOrangeA700011 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.orangeA70001,
      );

  static get titleMediumRobotoOrangeA7001 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.orangeA700,
      );

  // Title text style
  static get titleMediumRoboto1 => theme.textTheme.titleMedium!.roboto;

  static get titleMediumRoboto2 => theme.textTheme.titleMedium!.roboto;

  static get titleMedium1 => theme.textTheme.titleMedium!;

  static get titleSmallBluegray80002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray80002.withOpacity(0.8),
      );

  static get titleSmallBluegray90003 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray90003,
      );

  static get titleSmallGray100 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray100,
      );

  static get titleSmallOnError => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onError,
      );

  static get titleSmallOrangeA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.orangeA700,
      );

  static get titleSmallOrangeA70001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.orangeA70001,
      );

  static get titleSmallOrangeA70001_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.orangeA70001,
      );

  /// Headline Styles
  static get headlineMediumPrimary => theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get headlineMediumPrimaryBold =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
        fontWeight: FontWeight.w700,
      );

  static get headlineMediumPrimary1 => theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );
}
