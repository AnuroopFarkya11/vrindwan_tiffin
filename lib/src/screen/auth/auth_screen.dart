import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/auth_provider.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/user_state_provider.dart';
import 'package:vrindavantiffin/src/screen/auth/state/user_state.dart';

final _logger = Logger('AuthScreen');

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController otpTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Text('Auth'),
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
      padding: 10.padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: phoneTextEditingController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Mobile Number"),
          ),
          10.space,
          ElevatedButton(
              onPressed: () async {
                ref.read(authProvider.notifier).verifyNumberAndSendOtp(phoneTextEditingController.text);
              },
              child: Text('Sign up')),
          Divider(),
          ElevatedButton(
              onPressed: () {
                           },
              child: Text('Sign in')),
        ],
      ),
    );
  }

  _getOtpFragment() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: otpTextEditingController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: "Enter Otp"),
        ),
        10.space,
        ElevatedButton(
            onPressed: (){
              ref.read(authProvider.notifier).verifyOtpAndSignIn(otpTextEditingController.text.toString());
            },
            child: Text("Check"))
      ],
    );
  }
}
