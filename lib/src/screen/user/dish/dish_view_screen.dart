import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:input_quantity/input_quantity.dart';

import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/app.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/user/home/widget/food_card_two.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';
import 'package:vrindavantiffin/src/widgets/custom_rating_bar.dart';

class DishScreen extends ConsumerStatefulWidget {
  const DishScreen({super.key});

  @override
  ConsumerState<DishScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<DishScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 22.h, top: 8.h, right: 22.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStackFavorite(context),
                  24.space,
                  _buildDishName(),
                  10.space,
                  _buildRatingBar(context),
                  14.space,
                  _buildBuyNow(context),
                  20.space,
                  Text(
                    "Product Description",
                    style: CustomTextStyle.titleLargeRobotoPrimary_2,
                  ),
                  8.space,
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      "Description jdnvjnadslnvionaiosnvdio;nasio;nvonao;snc anvinfjvijeipvn[pam ]pojaop qj jpwvjp[oaj 9jfg[jwoe' jopjwiefhn q0wj9kjaopjdfionasiofvniosnvjn uaibwufbu anb ",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyle.bodyMediumRobotoPrimary_5,
                    ),
                  ),
                  20.space,
                  _getSuggestedDish(),

                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  _buildStackFavorite(BuildContext context) {
    return Container(
      height: 264.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: "assets/food.png",
            height: 264.h,
            width: double.maxFinite,
            radius: BorderRadius.circular(5.h),
          )
        ],
      ),
    );
  }

  _buildRatingBar(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      child: Row(
        children: [
          CustomRatingBar(
            initialRating: 4,
            itemSize: 30,
            color: appTheme.yellowA400,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(
                "4.0 ( 80 reviews )",
                style: CustomTextStyle.bodyLargeRobotoPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildBuyNow(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InputQty(
            decoration: QtyDecorationProps(
              enabledBorder: InputBorder.none,
              plusBtn: Container(
                height: 34.h,
                width: 34.h,
                decoration: BoxDecoration(
                    color: appTheme.orangeA700,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add,
                  size: 27.h,
                  color: Colors.white,
                ),
              ),
              minusBtn: Container(
                height: 34.h,
                width: 34.h,
                decoration: BoxDecoration(
                    color: appTheme.orangeA700,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.remove,
                  size: 27.h,
                  color: Colors.white,
                ),
              ),
            ),
            qtyFormProps: QtyFormProps(
                style: CustomTextStyle.titleLargeRobotoPrimaryRegular),
            isIntrinsicWidth: true,
          ),
          CustomElevatedButton(
            onPressed: () {},
            text: "Buy Now",
            height: 36.h,
            width: 82.h,
            buttonStyle: CustomButtonStyles.fillOrangeATL51,
            buttonTextStyle: CustomTextStyle.titleMediumRobotoOnError,
          )
        ],
      ),
    );
  }

  _buildDishName() {
    return Padding(
      padding: EdgeInsets.only(left: 4.h),
      child: Text(
        "Name",
        style: CustomTextStyle.headlineMediumPrimary1,
      ),
    );
  }

  _getSuggestedDish() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Suggestion dish",
          style: CustomTextStyle.headlineMediumPrimaryBold,

        ),
        15.space,
        ListView.separated(
            controller: scrollController,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return FoodCardTwo();
            },
            separatorBuilder: (context, index) {
              return 20.space;
            },
            itemCount: 3)
      ],
    );
  }
}
