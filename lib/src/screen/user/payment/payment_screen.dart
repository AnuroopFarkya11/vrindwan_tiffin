import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/admin/console/console_screen.dart';
import 'package:vrindavantiffin/src/shared/color/app_color.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';
import 'package:vrindavantiffin/src/widgets/custom_text_form_feild.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
                    children: [],
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

  _buildPaymentOptions(){

    return

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
            text: "CONTINUE".toUpperCase(),
            onPressed: () {},
            buttonStyle: CustomButtonStyles.fillOrangeATL51,
            buttonTextStyle: CustomTextStyle.titleSmallOnError,
          )
        ],
      ),
    );
  }


}
