import 'package:flutter/material.dart';
import 'package:vrindavantiffin/src/core/models/user.dart';

enum AuthStatus { authenticated, unauthenticated, failed, loading, initial }

@immutable
class AuthState {
  final AuthStatus status;
  final String? message;
  final UserDB user;

  const AuthState({required this.status, required this.user, this.message});

  AuthState copyWith({AuthStatus? status, UserDB? user, String? message}) {
    return AuthState(
        status: status ?? this.status,
        message: message ?? this.message,
        user: user ?? this.user);
  }
}
