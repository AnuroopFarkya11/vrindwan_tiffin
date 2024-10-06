import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/admin/console/console_screen.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_text_form_feild.dart';

class OtpScreenNew extends StatefulWidget {
  const OtpScreenNew({super.key});

  @override
  State<OtpScreenNew> createState() => _OtpScreenNewState();
}

class _OtpScreenNewState extends State<OtpScreenNew> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                            text: "We will send you an",
                            style: CustomTextStyle.bodyMediumRobotoPrimary_4,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "One Time Password",
                            style: CustomTextStyle.titleSmallPrimary,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "this mobile number",
                            style: CustomTextStyle.bodyMediumRobotoPrimary_4,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 38.h),

                    CustomTextFormField(
                      // controller: groupfiveoneController,
                      hintText: "+91 123 456 789",
                      textInputAction: TextInputAction.done,
                      contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
                    ),

                    SizedBox(height: 32.h),

                    CustomElevatedButton(
                      text: "GET OTP".toUpperCase(),
                      margin: EdgeInsets.symmetric(horizontal: 66.h),
                      buttonStyle: CustomButtonStyles.fillOrangeATL10,
                      onPressed: (){},
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
