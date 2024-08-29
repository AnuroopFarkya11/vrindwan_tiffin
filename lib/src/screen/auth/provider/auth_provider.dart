import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/user_state_provider.dart';
import 'package:vrindavantiffin/src/screen/auth/state/auth_state.dart';
import 'package:vrindavantiffin/src/screen/auth/state/user_state.dart';

final _logger = Logger('AuthProvider');

final authProvider =
    StateNotifierProvider<AuthProvider, AuthState>((ref) => AuthProvider(ref));

class AuthProvider extends StateNotifier<AuthState> {
  final Ref ref;

  AuthProvider(this.ref) : super(const AuthState(status: AuthStatus.initial)) {
    listenUserAuthState();
  }

  Future<void> listenUserAuthState() async {
    Stream<User?> authStream = await FirebaseAuth.instance.authStateChanges();
    authStream.listen((User? user) {
      if (user != null) {
        state = state.copyWith(status: AuthStatus.authenticated);
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    }, onError: (error) {
      state =
          state.copyWith(status: AuthStatus.failed, message: error.toString());
    });
  }

  Future<void> verifyNumberAndSendOtp(String number) async {
    FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          _logger.log('Exception while verification : ${ex.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          ref.read(userAuthStateProvider.notifier).state =
              UserAuthStatus.otpSent;
          state = state.copyWith(message: verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
        phoneNumber: number);
  }
  
  Future<void> verifyOtpAndSignIn (String code) async {
    try {
      PhoneAuthCredential credential =
      await PhoneAuthProvider.credential(
          verificationId: state.message??'',
          smsCode: code);

      await FirebaseAuth.instance
          .signInWithCredential(credential);
    } catch (ex) {
      _logger.log('Ex: $ex');
    }
  }
  
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseException catch (e) {
      _logger.log('Exception while logout: $e');
    }
  }
}
