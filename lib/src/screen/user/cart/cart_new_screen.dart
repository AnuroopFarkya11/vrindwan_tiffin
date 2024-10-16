import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/user/cart/provider/cart_provider.dart';
import 'package:vrindavantiffin/src/screen/user/cart/state/cart_state.dart';
import 'package:vrindavantiffin/src/screen/user/cart/widget/item_tile_new.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_text_form_feild.dart';

class CartNewScreen extends ConsumerStatefulWidget {
  const CartNewScreen({super.key});

  @override
  ConsumerState<CartNewScreen> createState() => _CartNewScreenState();
}

class _CartNewScreenState extends ConsumerState<CartNewScreen> {

  late CartProvider cartProviderRef;
  late CartState cartStateRef;

  @override
  Widget build(BuildContext context) {
    cartProviderRef = ref.watch(cartProvider.notifier);
    cartStateRef = ref.watch(cartProvider);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _buildRowContinue(),
      ),
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
    var entries = cartStateRef.entries;
    return Container(
      width: double.maxFinite,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: entries?.length??0,
        itemBuilder: (context, index) {
          return ItemTileNew(item: entries![index],cartProvider: cartProviderRef,);
        },
        separatorBuilder: (context, index) {
          return 15.space;
        },
      ),
    );
  }

  _buildRowContinue() {
    return Container(
      height: 250.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      decoration: BoxDecoration(
          color: theme.colorScheme.onError,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: theme.colorScheme.primary.withOpacity(0.05),
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: Offset(0, 0))
          ]),
      child: Column(
        children: [
          24.space,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal:",style: CustomTextStyle.titleMediumRobotoPrimary,),
              Text("Rs. ${ref.watch(cartProvider).total}",style: CustomTextStyle.titleMediumRobotoPrimary3,)
            ],
          ),
          12.space,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Discount:",style: CustomTextStyle.titleMediumRobotoPrimary,),
              Text("- Rs. 0",style: CustomTextStyle.titleMediumRobotoPrimary3,)
            ],
          ),

          12.space,
          Divider(),
          12.space,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total:",style: CustomTextStyle.headlineMediumPrimaryBold,),
              Text("Rs. ${cartStateRef.total}",style: CustomTextStyle.headlineMediumPrimary,)
            ],
          ),

          Spacer(),
          CustomElevatedButton(
            height: 50.h,
            width: double.maxFinite,
            text: "Order Now".toUpperCase(),
            onPressed: () {
              context.pushNamed(AppRoutes.delivery.name);
            },
            buttonStyle: CustomButtonStyles.fillOrangeATL51,
            buttonTextStyle: CustomTextStyle.titleSmallOnError,
          ),
        ],
      ),
    );
  }
}
