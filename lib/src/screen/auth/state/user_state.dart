enum UserAuthStatus { signIn, signUp, forgetPassword, otpSent }

class UserAuthState {
  final UserAuthStatus status;

  UserAuthState({required this.status});

  UserAuthState copyWith({UserAuthStatus? status}) {
    return UserAuthState(status: status ?? this.status);
  }
}
