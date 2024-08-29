import 'package:flutter/material.dart';

enum AuthStatus { authenticated, unauthenticated, failed, loading, initial }

@immutable
class AuthState {
  final AuthStatus status;
  final String? message;


  const AuthState({required this.status, this.message});

  AuthState copyWith({AuthStatus? status, String? message}) {
    return AuthState(
        status: status ?? this.status, message: message ?? this.message);
  }
}
