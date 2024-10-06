import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/auth_provider.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/user_state_provider.dart';
import 'package:vrindavantiffin/src/screen/auth/state/user_state.dart';
import 'package:vrindavantiffin/src/shared/color/app_color.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/cutom_button_style.dart';
import 'package:vrindavantiffin/src/widgets/custom_elevated_button.dart';
import 'package:vrindavantiffin/src/widgets/custom_text_form_feild.dart';

final _logger = Logger('AuthScreen');

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController otpTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getAppBar() {
    return AppBar(
    );
  }



  _getBody() {
    final userAuthState = ref.watch(userAuthStateProvider);
    switch (userAuthState) {
      case UserAuthStatus.signIn:
        {
          return _getSignInFragment();
        }
      case UserAuthStatus.signUp:
        {
          return _getSignUpFragment();
        }
      case UserAuthStatus.otpSent:
        return _getOtpFragment();
      default:
        {
          return Placeholder();
        }
    }
  }

  _getSignInFragment() {
    return Padding(
      padding: 10.padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Mobile Number"),
          ),
          10.space,
          TextField(
            decoration: InputDecoration(hintText: "Password"),
          ),
          10.space,
          ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Sign in')),
          Divider(),
          ElevatedButton(
              onPressed: () {
               ref.read(userAuthStateProvider.notifier).state = UserAuthStatus.signUp;
              },
              child: Text('Sign up')),
        ],
      ),
    );
  }

  _getSignUpFragment() {
    return Padding(
      padding: 35.paddingHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("Let’s Get Started",style: CustomTextStyle.headlineMediumPrimaryBold),
          5.space,
          Text("Create an new account",style: CustomTextStyle.bodyLargeRobotoPrimary1,),
          30.space,
          CustomTextFormField(
            controller: nameTextEditingController,
            hintText: "Name",
            contentPadding: EdgeInsets.fromLTRB(20.h, 18.h, 20.h, 16.h),
          ),
          24.space,
          CustomTextFormField(
            controller: phoneTextEditingController,
            textInputType: TextInputType.number,
            hintText: "Phone Number",
            contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),


          ),
//regular check 2
          34.space,
          CustomElevatedButton(
              onPressed: () async {
                ref.read(authProvider.notifier).verifyNumberAndSendOtp(phoneTextEditingController.text);
              },
              text: 'SIGN UP',
            margin: EdgeInsets.only(
              left: 66.h,
              right: 70.h
            ),
            buttonStyle: CustomButtonStyles.fillOrangeATL51,

          ),
          32.space,
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: "Already have an account? ",
                style: CustomTextStyle.bodyMediumRobotoPrimary_1
              ),
              TextSpan(
                  text: "Login here",
                  style: CustomTextStyle.titleSmallOrangeA70001
              ),
            ]

          ))
        ],
      ),
    );
  }

  _getOtpFragment() {
    return Padding(
      padding: 35.paddingHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("OTP VERIFICATION",style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),),
          5.space,
          Text("Enter the OTP sent to +91XXXXXXXXX",style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w100),),
          25.space,
          TextField(
            controller: otpTextEditingController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter Otp"),
          ),
          10.space,

          RichText(text: TextSpan(
              children: [
                TextSpan(
                    text: "Don't receive the OTP? ",
                    style: context.textTheme.labelMedium
                ),
                TextSpan(
                    text: "RESEND OTP",
                    style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.w800)
                ),
              ]

          )),

          25.space,
          ElevatedButton(
              onPressed: (){
                ref.read(authProvider.notifier).verifyOtpAndSignIn(otpTextEditingController.text.toString());
              },
              child: Text("VERIFY & PROCEED"))
        ],
      ),
    );
  }
}
