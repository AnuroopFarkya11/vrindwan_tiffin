import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';

class FoodCardOne extends StatelessWidget {
  const FoodCardOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        context.pushNamed(AppRoutes.dish.name);
      },
      child: SizedBox(
        height: 200,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 190,
                width: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/food.png",
                      height: 190,
                      width: double.infinity,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.maxFinite,
                        padding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            2.space,
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
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return 20.space;
            },
            itemCount: 4),
      ),
    );
  }
}
