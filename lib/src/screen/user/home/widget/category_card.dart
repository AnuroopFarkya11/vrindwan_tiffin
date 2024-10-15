import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  const CategoryCard({super.key,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      },
      child: SizedBox(
        width: 76,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 76,
              width: double.maxFinite,
              decoration: ShapeDecoration(
                  color: appTheme.orangeA700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Icon(
                Icons.emoji_food_beverage_outlined,
                size: 55,
                color: context.colorScheme.surface,
              ),
            ),
            10.space,
            Text(
              categoryName??"",
              style: CustomTextStyle.bodyLargeRobotoPrimary,
            )
          ],
        ),
      ),
    );
  }
}
