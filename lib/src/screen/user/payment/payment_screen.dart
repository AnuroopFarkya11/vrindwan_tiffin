import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/admin/console/console_screen.dart';
import 'package:vrindavantiffin/src/screen/user/order/provider/order_provider.dart';
import 'package:vrindavantiffin/src/screen/user/payment/widget/payment_mode_tile.dart';
import 'package:vrindavantiffin/src/shared/color/app_color.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';
import 'package:vrindavantiffin/src/widgets/custom_text_form_feild.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
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
        "Payment",
        style: CustomTextStyle.titleLargeRobotoPrimary_1,
      ),
    );
  }

  _buildBody() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.space,
          _buildStepper(),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 24.h),
              child: Column(
                children: [_buildPaymentOptions()],
              ),
            ),
          ))
        ],
      ),
    );
  }

  _buildStepper() {
    return Container(
        width: double.maxFinite,
        padding: 22.paddingHorizontal,
        child: AnotherStepper(
            iconHeight: 76.h,
            iconWidth: 65.h,
            activeIndex: 0,
            barThickness: 2,
            inverted: true,
            stepperList: [
              StepperData(
                  iconWidget: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    child: CircleAvatar(
                      backgroundColor: appTheme.blueGray80001,
                      child: CustomImageView(
                        imagePath: "assets/icons/marker.svg",
                        height: 25.h,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  title: StepperText("Address",
                      textStyle: CustomTextStyle.bodyMediumRobotoPrimary_3)),
              StepperData(
                  iconWidget: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    child: CircleAvatar(
                      backgroundColor: appTheme.blueGray80001,
                      child: CustomImageView(
                        imagePath: "assets/icons/file.svg",
                        height: 25.h,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  title: StepperText("Order Summary",
                      textStyle: CustomTextStyle.bodyMediumRobotoPrimary_3)),
              StepperData(
                  iconWidget: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    child: CircleAvatar(
                      backgroundColor: appTheme.orangeA700,
                      child: CustomImageView(
                        imagePath: "assets/icons/card.svg",
                        height: 25.h,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  title: StepperText("Payment",
                      textStyle: CustomTextStyle.titleSmall1))
            ],
            stepperDirection: Axis.horizontal));
  }

  _buildPaymentOptions() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(color: theme.colorScheme.onError, boxShadow: [
        BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.05),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(0, 1))
      ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          8.space,
          Container(
            padding: 22.paddingHorizontal,
            width: double.maxFinite,
            child: Text(
              "Payment Options",
              style: CustomTextStyle.titleMediumRobotoPrimary3,
            ),
          ),
          16.space,
          _buildPaymentOptionsTile()

        ],
      ),
    );
  }

  _buildRowContinue() {
    return Container(
      height: 70.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      decoration: BoxDecoration(color: theme.colorScheme.onError),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomElevatedButton(
            height: 50.h,
            width: 146.h,
            text: "Place Order".toUpperCase(),
            onPressed: (){
              context.pushNamed(AppRoutes.orderPlaced.name);
              ref.read(orderProvider.notifier).placeOrder();
            },
            buttonStyle: CustomButtonStyles.fillOrangeATL51,
            buttonTextStyle: CustomTextStyle.titleSmallOnError,
          )
        ],
      ),
    );
  }

  _buildPaymentOptionsTile(){
    final List<String> paymentMethods = ['Credit Card', 'Debit Card', 'PayPal', 'Net Banking', 'UPI', 'Cash On Delivery'];
    return  Padding(
      padding:EdgeInsets.only(left: 10.h,right: 20.h),
      child: ListView.separated(
        shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Divider(
              height: 1.h,
              thickness: 1.h,
              color: theme.colorScheme.primary.withOpacity(0.2),

            );
          },
        itemCount: paymentMethods.length,
        itemBuilder: (context,index){
          return RadioListTile<String>(
            fillColor: WidgetStateProperty.all(Colors.black),
            title: Text(paymentMethods[index]),
            value: paymentMethods[index],
            groupValue: selectedMethod,
            onChanged: (String? value) {
              setState(() {
                selectedMethod = value;
              });
            },
          );
        },
      ),
    );
  }
}
