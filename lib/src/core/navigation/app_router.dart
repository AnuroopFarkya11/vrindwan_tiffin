import 'package:go_router/go_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/screen/auth/auth_controller.dart';
import 'package:vrindavantiffin/src/screen/auth/otp_screen.dart';
import 'package:vrindavantiffin/src/screen/home/home_screen.dart';

class AppRouter {
  GoRouter get router => _router;

  final _router = GoRouter(routes: [
    GoRoute(
        path: AppRoutes.auth.path,
        name: AppRoutes.auth.name,
        builder: (context, state) => const AuthController(),
        routes: [
          GoRoute(
              path: AppRoutes.otp.path,
              name: AppRoutes.otp.name,
              builder: (context, state) {
                String id = state.extra as String;
                return OtpScreen(
                  verificationId: id,
                );
              }),
          GoRoute(
            path: AppRoutes.home.path,
            name: AppRoutes.home.name,
            builder: (context,state)=>HomeScreen()
          )
        ])
  ]);
}
