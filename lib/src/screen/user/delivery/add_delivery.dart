import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/admin/console/console_screen.dart';
import 'package:vrindavantiffin/src/shared/color/app_color.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';

class AddDeliveryAddressScreen extends StatefulWidget {
  const AddDeliveryAddressScreen({super.key});

  @override
  State<AddDeliveryAddressScreen> createState() =>
      _AddDeliveryAddressScreenState();
}

class _AddDeliveryAddressScreenState extends State<AddDeliveryAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(
        "Add delivery address",
        style: CustomTextStyle.titleLargeRobotoPrimary_1,
      ),
    );
  }

  _buildBody() {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [

            _buildStepper(),
            24.space,


          ],
        ),
      ),
    );
  }

  _buildStepper() {
    return Container(
        width: double.maxFinite,
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
                      backgroundColor: appTheme.orangeA700,
                      child: CustomImageView(
                        imagePath: "assets/icons/marker.svg",
                        height: 25.h,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  title: StepperText("Address",
                      textStyle: CustomTextStyle.titleSmall1)),
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
                      backgroundColor: appTheme.blueGray80001,
                      child: CustomImageView(
                        imagePath: "assets/icons/card.svg",
                        height: 25.h,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  title: StepperText("Payment",
                      textStyle: CustomTextStyle.bodyMediumRobotoPrimary_3))
            ],
            stepperDirection: Axis.horizontal));
  }
}
