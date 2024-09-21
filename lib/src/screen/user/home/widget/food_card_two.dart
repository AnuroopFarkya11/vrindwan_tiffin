import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';

class FoodCardTwo extends StatelessWidget {
  const FoodCardTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.h),
      decoration: BoxDecoration(
          color: theme.colorScheme.onError,
          borderRadius: BorderRadius.circular(5)),

      child: Row(
        children: [
          CustomImageView(
            imagePath: "assets/food.png",
            height: 78.h,
            width: 78.h,
            radius: BorderRadius.circular(5.h),
          ),

          SizedBox(
            width: 12.h,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Normal Thali",
                  style: CustomTextStyle.titleMediumRoboto1,
                ),
                4.space,
                Text(
                  "Description",
                  style: CustomTextStyle.bodySmallRoboto1,
                ),
                4.space,
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Rs. 150",
                          style:
                          CustomTextStyle.bodyMediumRoboto1,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.h, vertical: 2.h),
                        decoration: BoxDecoration(
                            color: appTheme.orangeA700,
                            borderRadius:
                            BorderRadius.circular(5)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "5 left",
                              style: theme.textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )


              ],
            ),
          )



        ],
      ),
    );
  }
}