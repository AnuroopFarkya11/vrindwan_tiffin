import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/admin/console/console_screen.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/auth_provider.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_text_form_feild.dart';

class OtpScreenNew extends ConsumerStatefulWidget {
  final String number;
  const OtpScreenNew({super.key,required this.number});

  @override
  ConsumerState<OtpScreenNew> createState() => _OtpScreenNewState();
}

class _OtpScreenNewState extends ConsumerState<OtpScreenNew> {

  TextEditingController phoneTextEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    phoneTextEditingController.text = widget.number;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
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
                            text: "the below mobile number",
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
                      controller: phoneTextEditingController,
                      hintText: "830 XXX XXX",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.numberWithOptions(),
                      contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
                    ),

                    SizedBox(height: 32.h),

                    CustomElevatedButton(
                      text: "GET OTP".toUpperCase(),
                      margin: EdgeInsets.symmetric(horizontal: 66.h),
                      buttonStyle: CustomButtonStyles.fillOrangeATL10,
                      onPressedAsync: ()async{
                        await Future.delayed(Duration(seconds: 2));
                        ref.read(authProvider).user.phoneNumber = phoneTextEditingController.text;
                        context.pushNamed(AppRoutes.otpPin.name,extra:widget.number);
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
}
