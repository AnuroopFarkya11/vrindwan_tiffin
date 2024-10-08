import 'package:flutter/material.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_text_form_feild.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      child: Scaffold(
        // appBar: _buildAppbar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 22.h,
                top: 46.h,
                right: 22.h,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 14.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 174.h,
                        ),
                        // CustomImageView(
                        //   imagePath: ImageConstant.imgUndrawAuthenticationFsn5,
                        //   height: 174.h,
                        //   width: double.maxFinite,
                        //   margin: EdgeInsets.symmetric(horizontal: 22.h),
                        // ),
                        SizedBox(height: 34.h),
                        Text(
                          "Create new password".toUpperCase(),
                          style: CustomTextStyle.titleLargeRobotoPrimaryExtraBold_1,
                        ),
                        SizedBox(height: 8.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "Your new password must be different from previously used passwords",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.bodyMediumRobotoPrimary_5,
                          ),
                        ),
                        SizedBox(height: 22.h),
                        CustomTextFormField(
                          // controller: newpasswordController,
                          hintText: "New password",
                          textInputType: TextInputType.visiblePassword,
                          suffix: Container(
                            margin: EdgeInsets.fromLTRB(16.h, 20.h, 24.h, 20.h),
                            child: Container(height: 18.h,width: 20.h,),

                            /*child: CustomImageView(
                              imagePath: ImageConstant.imgEye,
                              height: 18.h,
                              width: 20.h,
                              fit: BoxFit.contain,
                            )*/
                          ),
                          suffixConstraints: BoxConstraints(
                            maxHeight: 60.h,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.h,
                            vertical: 18.h,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          // controller: confirmpasswordController,
                          hintText: "Confirm password",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          suffix: Container(
                            margin: EdgeInsets.fromLTRB(16.h, 20.h, 24.h, 20.h),
                           /* child: CustomImageView(
                              imagePath: ImageConstant.imgEye,
                              height: 18.h,
                              width: 20.h,
                              fit: BoxFit.contain,
                            ),*/
                            child: Container(height: 18.h,width: 20.h,),
                          ),
                          suffixConstraints: BoxConstraints(
                            maxHeight: 60.h,
                          ),
                          obscureText: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.h,
                            vertical: 18.h,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        CustomElevatedButton(
                          text: "Reset password".toUpperCase(),
                          margin: EdgeInsets.symmetric(horizontal: 28.h),
                          buttonStyle: CustomButtonStyles.fillOrangeATL10,
                          onPressed: (){},
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );


  }
}
