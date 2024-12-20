import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/user/dish/dish_view_screen.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';

class FoodCardOne extends StatelessWidget {
  final FoodItem item;
  const FoodCardOne({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        // context.pushNamed(AppRoutes.dish.name);
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: DishScreen(item: item,),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

      },
      child: SizedBox(
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
                      item.name??"",
                      style: CustomTextStyle.titleMediumRoboto1,
                    ),
                    4.space,
                    Text(
                    item.description??"",
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
                              "Rs. ${item.price}",
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
      ),
    );
  }
}
