import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/admin/console/console_screen.dart';
import 'package:vrindavantiffin/src/shared/color/app_color.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_image_view.dart';
import 'package:vrindavantiffin/src/widgets/custom_text_form_feild.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
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
        "Add delivery address",
        style: CustomTextStyle.titleLargeRobotoPrimary_1,
      ),
    );
  }

  _buildBody() {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Padding(
          padding: 22.paddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.space,
              _buildStepper(),
              24.space,
              _buildNameField(),
              24.space,
              _buildPhoneField(),
              24.space,
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text(
                  "+ Add Alternate Phone Number",
                  style: CustomTextStyle.titleSmallOrangeA700,
                ),
              ),
              24.space,
              _buildRowPinCodeAndUseMyLocation(),
              24.space,
              _buildRowStateAndCity(),
              24.space,
              _buildAddressField(),
              24.space,
              _buildAddressField2(),
              24.space,
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text(
                  "+ Add Near By Landmark",
                  style: CustomTextStyle.titleSmall1,
                ),
              ),
              24.space
            ],
          ),
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

  _buildNameField() {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: CustomTextFormField(
        hintText: "Name*",
        contentPadding: EdgeInsets.fromLTRB(20.h, 18.h, 20.h, 16.h),
      ),
    );
  }

  _buildPhoneField() {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: CustomTextFormField(
        hintText: "Phone Number*",
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
      ),
    );
  }

  _buildRowPinCodeAndUseMyLocation() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      child: Row(
        children: [
          _buildPinCodeField(),
          24.spaceHorizontal,
          _buildUseMyLocation()
        ],
      ),
    );
  }

  _buildPinCodeField() {
    return Expanded(
      child: CustomTextFormField(
        hintText: "Pincode*",
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
      ),
    );
  }

  _buildUseMyLocation() {
    return Expanded(
        child: CustomElevatedButton(
      height: 60.h,
      text: "Use My Location",
      onPressed: () {},
      leftIcon: Container(
        margin: EdgeInsets.only(right: 6.h),
        child: CustomImageView(
          height: 18.h,
          width: 14.h,
          imagePath: "assets/icons/marker.svg",
          fit: BoxFit.contain,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillOrangeATL10,
      buttonTextStyle: CustomTextStyle.titleSmallOnError,
    ));
  }

  _buildRowStateAndCity() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      child: Row(
        children: [_buildStateField(), 24.spaceHorizontal, _buildCityField()],
      ),
    );
  }

  _buildStateField() {
    return Expanded(
      child: CustomTextFormField(
        hintText: "State*",
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
      ),
    );
  }

  _buildCityField() {
    return Expanded(
      child: CustomTextFormField(
        hintText: "City*",
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
      ),
    );
  }

  _buildAddressField() {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: CustomTextFormField(
        hintText: "House No. Building Number",
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.fromLTRB(14.h, 18.h, 14.h, 12.h),
      ),
    );
  }

  _buildAddressField2() {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: CustomTextFormField(
        hintText: "Road Name, Area, Colony",
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
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
            text: "CONTINUE".toUpperCase(),
            onPressed: () {
              context.pushNamed(AppRoutes.orderSummary.name);
            },
            buttonStyle: CustomButtonStyles.fillOrangeATL51,
            buttonTextStyle: CustomTextStyle.titleSmallOnError,
          )
        ],
      ),
    );
  }
}
