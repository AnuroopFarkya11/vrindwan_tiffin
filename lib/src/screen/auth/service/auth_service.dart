import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/models/user.dart';
import 'package:vrindavantiffin/src/screen/auth/repository/auth%20_repository.dart';

final authServiceProvider = Provider((ref) => AuthService());

class AuthService extends AuthRepository {
  final _logger = Logger("AuthService");

  Future<Stream<User?>> listenAuthState() async {
    return await auth.authStateChanges();
  }

  Future<String?> verifyNumberAndSendOtp(String number) async {
    Completer<String?> completer = Completer();

    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-retrieve
      },
      verificationFailed: (FirebaseAuthException ex) {
        _logger.log('Exception while verification : ${ex.message}');
        completer.completeError(ex.message ?? "");
      },
      codeSent: (String verificationId, int? resendToken) {
        _logger.log('Verification code sent');
        completer.complete(verificationId); // Complete with the verificationId
      },
      codeAutoRetrievalTimeout: (String verificationID) {},
    );

    return completer.future;
  }

  Future<void> verifyOtpAndSignIn(String otp, String code) async {
    PhoneAuthCredential credential =
        await PhoneAuthProvider.credential(verificationId: otp, smsCode: code);

    await auth.signInWithCredential(credential);
  }

  Future<UserDB> registerUser({required UserDB user}) async {
    String endPoint = "/public/create-user";
    final response = await dioClient.post(endPoint, data: {
      "uid": '00000',
      "name": user.name,
      "password": user.password,
      "phoneNumber": user.phoneNumber,
      "role": "USER"
    });

    _logger.log("User created successfully : ${response.data}");
    return UserDB.fromJson(response.data);
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
