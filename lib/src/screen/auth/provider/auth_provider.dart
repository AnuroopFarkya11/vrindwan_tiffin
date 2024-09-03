import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/user_state_provider.dart';
import 'package:vrindavantiffin/src/screen/auth/service/auth_service.dart';
import 'package:vrindavantiffin/src/screen/auth/state/auth_state.dart';
import 'package:vrindavantiffin/src/screen/auth/state/user_state.dart';

final _logger = Logger('AuthProvider');

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  final service = ref.watch(authServiceProvider);
  return AuthProvider(ref, service);
});

class AuthProvider extends StateNotifier<AuthState> {
  final Ref ref;
  final AuthService service;

  AuthProvider(this.ref, this.service)
      : super(const AuthState(status: AuthStatus.initial)) {
    listenUserAuthState();
  }

  Future<void> listenUserAuthState() async {
    Stream<User?> authStream = await service.listenAuthState();
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
    try {
      final String? verificationId =
          await service.verifyNumberAndSendOtp(number);

      if (verificationId != null) {
        _logger.log("Verification ID received");
        ref.read(userAuthStateProvider.notifier).state = UserAuthStatus.otpSent;
        state = state.copyWith(
            message: verificationId); // Update the state with verificationId
      } else {
        _logger.log("Failed to receive Verification ID");
        state = state.copyWith(
            status: AuthStatus.failed,
            message: "Failed to receive Verification ID");
      }
    } catch (error) {
      _logger.log("Error during OTP verification: $error");
      state =
          state.copyWith(status: AuthStatus.failed, message: error.toString());
    }
  }

  Future<void> verifyOtpAndSignIn(String code) async {
    try {
      await service.verifyOtpAndSignIn(state.message ?? '', code);
    } catch (ex) {
      _logger.log('Ex: $ex');
    }
  }

  Future<void> logout() async {
    try {
      await service.logout();
    } on FirebaseException catch (e) {
      _logger.log('Exception while logout: $e');
    }
  }
}
