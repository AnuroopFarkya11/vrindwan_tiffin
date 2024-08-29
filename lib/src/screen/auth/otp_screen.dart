import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';

final _logger = Logger('OtpScreen');

class OtpScreen extends StatefulWidget {
  final String verificationId;

  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() {
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
            onPressed: () async {
              try {
                PhoneAuthCredential credential =
                    await PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otpTextEditingController.text.toString());

                await FirebaseAuth.instance
                    .signInWithCredential(credential);
              } catch (ex) {
                _logger.log('Ex: $ex');
              }
            },
            child: Text("Check"))
      ],
    );
  }
}
