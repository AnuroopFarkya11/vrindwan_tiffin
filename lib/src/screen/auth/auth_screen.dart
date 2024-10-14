import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/core/utils/validators_functions.dart';
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
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController otpTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phoneTextEditingController.text = '9826337267';
    passwordTextEditingController.text = 'Anuroop';
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: _getAppBar(),
          body: _getBody()),
    );
  }

  _getAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
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
    return Container(
      width: double.maxFinite,
      padding: 22.padding,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: 14.paddingHorizontal,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back!",
                    style: CustomTextStyle.headlineMediumPrimary,
                  ),
                  6.space,
                  Text(
                    "Log in to your existant account",
                    style: CustomTextStyle.bodyLargeRobotoPrimary1,
                  ),
                ],
              ),
            ),
            24.space,
            CustomTextFormField(
              controller: phoneTextEditingController,
              hintText: "Mobile Number",
              contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
            ),
            24.space,
            CustomTextFormField(
              controller: passwordTextEditingController,
              hintText: "Password",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 18.h,
                vertical: 18.h,
              ),
            ),
            12.space,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: CustomTextStyle.titleSmallOrangeA70001_1,
              ),
            ),
            20.space,
            CustomElevatedButton(
              onPressedAsync: () async{
                // ref.watch(authProvider.notifier).authenticate();
                await ref.read(authProvider.notifier).login(
                  username: phoneTextEditingController.text,
                  password: passwordTextEditingController.text
                );
              },
              text: 'SIGN IN',
              buttonStyle: CustomButtonStyles.fillOrangeATL51,
              margin: EdgeInsets.symmetric(horizontal: 66.h),
            ),
            24.space,
            Text(
              'Or connect using',
              style: CustomTextStyle.bodyMediumRoboto1,
            ),
            14.space,
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 14.h, right: 6.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    height: 36.h,
                    width: 114.h,
                    text: 'Google',
                    buttonStyle: CustomButtonStyles.fillOrangeATL51,
                    buttonTextStyle: CustomTextStyle.titleSmallGray100,
                    onPressed: () {},
                  ),
                  CustomElevatedButton(
                    height: 36.h,
                    width: 114.h,
                    text: 'Facebook',
                    buttonStyle: CustomButtonStyles.fillOrangeATL51,
                    buttonTextStyle: CustomTextStyle.titleSmallGray100,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            22.space,
            GestureDetector(
              onTap: () {
                ref.read(userAuthStateProvider.notifier).state =
                    UserAuthStatus.signUp;
              },
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Don't have an account? ",
                    style: CustomTextStyle.bodyMediumRoboto2),
                TextSpan(
                    text: "Sign up",
                    style: CustomTextStyle.titleSmallOrangeA70001),
              ])),
            ),
          ],
        ),
      ),
    );
  }

  _getSignUpFragment() {
    return Padding(
      padding: 35.paddingHorizontal,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Let’s Get Started",
                style: CustomTextStyle.headlineMediumPrimaryBold),
            5.space,
            Text(
              "Create an new account",
              style: CustomTextStyle.bodyLargeRobotoPrimary1,
            ),
            30.space,
            CustomTextFormField(
              controller: nameTextEditingController,
              hintText: "Name",
              contentPadding: EdgeInsets.fromLTRB(20.h, 18.h, 20.h, 16.h),
              validator: (value) {
                return isText(value, isRequired: true)
                    ? null
                    : "Please enter your name";
              },
            ),
            24.space,
            CustomTextFormField(
              controller: phoneTextEditingController,
              validator: (value) {
                return isValidPhone(value, isRequired: true)
                    ? null
                    : "Please enter a valid number";
              },
              textInputType: TextInputType.number,
              hintText: "Phone Number",
              contentPadding: EdgeInsets.fromLTRB(18.h, 18.h, 18.h, 14.h),
            ),
            34.space,
            CustomElevatedButton(
              onPressed: () async {
                /* ref
                    .read(authProvider.notifier)
                    .verifyNumberAndSendOtp(phoneTextEditingController.text);*/
                bool res = _formKey.currentState!.validate();
                if (res) {
                  ref.watch(authProvider).user.name =
                      nameTextEditingController.text;
                  context.goNamed(AppRoutes.otp.name,
                      extra: phoneTextEditingController.text);
                }
              },
              text: 'SIGN UP',
              margin: EdgeInsets.only(left: 66.h, right: 70.h),
              buttonStyle: CustomButtonStyles.fillOrangeATL51,
            ),
            32.space,
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Already have an account? ",
                  style: CustomTextStyle.bodyMediumRobotoPrimary_1),
              TextSpan(
                  text: "Login here",
                  style: CustomTextStyle.titleSmallOrangeA70001),
            ]))
          ],
        ),
      ),
    );
  }

  _getOtpFragment() {
    return Padding(
      padding: 35.paddingHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "OTP VERIFICATION",
            style: context.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          5.space,
          Text(
            "Enter the OTP sent to +91XXXXXXXXX",
            style: context.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w100),
          ),
          25.space,
          TextField(
            controller: otpTextEditingController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter Otp"),
          ),
          10.space,
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Don't receive the OTP? ",
                style: context.textTheme.labelMedium),
            TextSpan(
                text: "RESEND OTP",
                style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w800)),
          ])),
          25.space,
          ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).verifyOtpAndSignIn(
                    otpTextEditingController.text.toString());
              },
              child: Text("VERIFY & PROCEED"))
        ],
      ),
    );
  }
}
