import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/screen/auth/auth_screen.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/auth_provider.dart';
import 'package:vrindavantiffin/src/screen/auth/state/auth_state.dart';
import 'package:vrindavantiffin/src/screen/user/home/home_screen.dart';

class AuthController extends ConsumerWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authProvider);

    switch (authStatus.status) {
      case AuthStatus.authenticated:
        {
          return HomeScreen();
        }
      case AuthStatus.unauthenticated:
        {
          return const AuthScreen();
        }
      case AuthStatus.failed:
        {
          // todo Error screen
          return Placeholder();
        }

      default:
        {
          return Center(child: CircularProgressIndicator(),);
        }
    }
  }
}
