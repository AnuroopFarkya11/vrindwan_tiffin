import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vrindavantiffin/src/app.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';

class CustomRatingBar extends StatelessWidget {
  CustomRatingBar({
    super.key,
    this.alignment,
    this.ignoreGestures,
    this.initialRating,
    this.itemSize,
    this.itemCount,
    this.color,
    this.unselectedColor, this.onRatingUpdate,
  });

  final Alignment? alignment;
  final bool? ignoreGestures;
  final double? initialRating;
  final double? itemSize;
  final int? itemCount;
  final Color? color;
  final Color? unselectedColor;
  final Function(double)? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return alignment != null ? Align(
      alignment: alignment ?? Alignment.center, child:,) :
  }

  Widget get ratingBarWidget =>
      RatingBar.builder(
        itemBuilder: (context, int) {
          return Icon(
            Icons.star,
            color: color ?? appTheme.gray400,
          );
        },
        onRatingUpdate: (rating) {
          onRatingUpdate!.call(rating);
        },
        ignoreGestures: ignoreGestures ?? false,
        initialRating: initialRating ?? 0,
        minRating: 0,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemSize: itemSize ?? 20.h,
        unratedColor: unselectedColor,
        itemCount: itemCount ?? 4,
        updateOnDrag: true,


      );
}
