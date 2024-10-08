import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_pin_code_textfield.dart';
import 'package:vrindavantiffin/src/widgets/custom_text_form_feild.dart';

class OtpPinScreen extends StatefulWidget {
  final String number;

  const OtpPinScreen({super.key, required this.number});

  @override
  State<OtpPinScreen> createState() => _OtpPinScreenState();
}

class _OtpPinScreenState extends State<OtpPinScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(),
      body: _buildBody(),
    ));
  }

  _buildBody() {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 22.h, top: 58.h, right: 22.h),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: 14.paddingHorizontal,
                child: Column(
                  children: [
                    28.space,
                    Text(
                      "OTP verification".toUpperCase(),
                      style: CustomTextStyle.titleLargeRobotoPrimaryExtraBold_1,
                    ),
                    6.space,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Enter the otp sent to",
                            style: CustomTextStyle.bodyMediumRobotoPrimary_4,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "${widget.number}",
                            style: CustomTextStyle.titleSmallPrimary,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    38.space,
                    SizedBox(
                      width: double.maxFinite,
                      child: CustomPinCodeTextField(
                          context: context, onChanged: (value) {}),
                    ),
                    14.space,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Didn't received the OTP?",
                            style: CustomTextStyle.bodyMediumRobotoPrimary_4,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: " RESEND OTP",
                            style: CustomTextStyle.titleSmallOrangeA70001,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    32.space,
                    CustomElevatedButton(
                      text: "Verify & Proceed".toUpperCase(),
                      margin: EdgeInsets.symmetric(horizontal: 28.h),
                      buttonStyle: CustomButtonStyles.fillOrangeATL10,
                      onPressedAsync: () async {
                        await Future.delayed(Duration(seconds: 2));
                        context.pushNamed(AppRoutes.password.name);
                      },
                    ),
                  ],
                ),
              ),
              4.space
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
    );
  }
}
