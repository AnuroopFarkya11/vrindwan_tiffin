import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/user/cart/widget/item_tile_new.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';

class CartNewScreen extends StatefulWidget {
  const CartNewScreen({super.key});

  @override
  State<CartNewScreen> createState() => _CartNewScreenState();
}

class _CartNewScreenState extends State<CartNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildRowContinue(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(
        "Cart",
        style: CustomTextStyle.titleLargeRobotoPrimary_1,
      ),
    );
  }

  _buildBody() {
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          _buildCartItems(),
        ],
      ),
    );
  }

  _buildCartItems() {
    return Container(
      width: double.maxFinite,
      child: ListView.separated(
        shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return ItemTileNew();
          },
        separatorBuilder: (context,index){
          return 15.space;
        },

          ),
    );
  }

  _buildRowContinue() {
    return Container(
      height: 70.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      decoration: BoxDecoration(color: theme.colorScheme.onError),
      child: CustomElevatedButton(
        height: 50.h,
        width: double.maxFinite,
        text: "Order NOw".toUpperCase(),
        onPressed: () {
          context.pushNamed(AppRoutes.delivery.name);
        },
        buttonStyle: CustomButtonStyles.fillOrangeATL51,
        buttonTextStyle: CustomTextStyle.titleSmallOnError,
      ),
    );
  }
}
