import 'package:go_router/go_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/screen/admin/console/console_screen.dart';
import 'package:vrindavantiffin/src/screen/admin/form/form_screen.dart';
import 'package:vrindavantiffin/src/screen/admin/form/route/form_route.dart';
import 'package:vrindavantiffin/src/screen/auth/auth_controller.dart';
import 'package:vrindavantiffin/src/screen/auth/otp_screen.dart';
import 'package:vrindavantiffin/src/screen/user/cart/cart_screen.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/add_delivery.dart';
import 'package:vrindavantiffin/src/screen/user/dish/dish_view_screen.dart';
import 'package:vrindavantiffin/src/screen/user/home/home_screen.dart';
import 'package:vrindavantiffin/src/screen/user/order/order_summary_screen.dart';
import 'package:vrindavantiffin/src/screen/user/payment/payment_screen.dart';

class AppRouter {
  GoRouter get router => _router;

  final _router = GoRouter(routes: [
    GoRoute(
        path: AppRoutes.auth.path,
        name: AppRoutes.auth.name,
        builder: (context, state) => const PaymentScreen(),
        routes: [
          GoRoute(
              path: AppRoutes.console.path,
              name: AppRoutes.console.name,
              builder: (context, state) => ConsoleScreen(),
              routes: [
                GoRoute(
                    path: AppRoutes.form.path,
                    name: AppRoutes.form.name,
                    builder: (context, state) {
                      FormRoute route = state.extra as FormRoute;
                      return ConsoleFormScreen(route: route);
                    })
              ]),
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
              builder: (context, state) => HomeScreen()),
          GoRoute(
              path: AppRoutes.cart.name,
              name: AppRoutes.cart.name,
              builder: (context, state) => CartScreen()),
          GoRoute(
              path: AppRoutes.payment.path,
              name: AppRoutes.payment.name,
              builder: (context, state) => PaymentScreen()),
          GoRoute(
              path: AppRoutes.dish.path,
              name: AppRoutes.dish.name,
              builder: (context, state) => DishScreen()),


        ]),
  ]);
}
