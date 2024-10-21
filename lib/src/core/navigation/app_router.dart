import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/screen/admin/console/console_screen.dart';
import 'package:vrindavantiffin/src/screen/admin/form/form_screen.dart';
import 'package:vrindavantiffin/src/screen/admin/form/route/form_route.dart';
import 'package:vrindavantiffin/src/screen/auth/auth_controller.dart';
import 'package:vrindavantiffin/src/screen/auth/auth_screen.dart';
import 'package:vrindavantiffin/src/screen/auth/screen/otp/otp_pin_screen.dart';
import 'package:vrindavantiffin/src/screen/auth/screen/otp/otp_screen.dart';
import 'package:vrindavantiffin/src/screen/auth/screen/otp_screen.dart';
import 'package:vrindavantiffin/src/screen/auth/screen/password/create_new_password.dart';
import 'package:vrindavantiffin/src/screen/user/cart/cart_new_screen.dart';
import 'package:vrindavantiffin/src/screen/user/cart/cart_screen.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/delivery_address.dart';
import 'package:vrindavantiffin/src/screen/user/dish/dish_view_screen.dart';
import 'package:vrindavantiffin/src/screen/user/home/home_screen.dart';
import 'package:vrindavantiffin/src/screen/user/order/order_summary_screen.dart';
import 'package:vrindavantiffin/src/screen/user/payment/payment_screen.dart';
import 'package:vrindavantiffin/src/screen/user/user_main_screen.dart';

class AppRouter {
  GoRouter get router => _router;

  final _router = GoRouter(routes: [
    GoRoute(
        path: AppRoutes.auth.path,
        name: AppRoutes.auth.name,
        builder: (context, state) => const UserMainScreen(),
        routes: [
          /// Admin console
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

          /// Otp Screen
          GoRoute(
              path: AppRoutes.otp.path,
              name: AppRoutes.otp.name,
              pageBuilder: (context, state) {
                String number = state.extra as String;

                return CustomTransitionPage(
                    child: OtpScreenNew(
                      number: number,
                    ),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(
                            Tween(begin: Offset(0.0, 1.0), end: Offset.zero)),
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    });
                // return OtpScreenNew();
              }),

          /// Otp pin screen
          GoRoute(
              path: AppRoutes.otpPin.path,
              name: AppRoutes.otpPin.name,
              pageBuilder: (context, state) {
                String number = state.extra as String;

                return CustomTransitionPage(
                  child: OtpPinScreen(
                    number: number,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                );
                // return OtpScreenNew();
              }),

          /// Password Screen
          GoRoute(
              path: AppRoutes.password.path,
              name: AppRoutes.password.name,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  child: CreateNewPasswordScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                );
                // return OtpScreenNew();
              }),

          /// Home Screen
          GoRoute(
            path: AppRoutes.home.path,
            name: AppRoutes.home.name,
            builder: (context, state) => HomeScreen(),
          ),

          /// Cart Screen
          GoRoute(
              path: AppRoutes.cart.name,
              name: AppRoutes.cart.name,
              builder: (context, state) => CartNewScreen()),

          /// Payment Screen
          GoRoute(
              path: AppRoutes.payment.path,
              name: AppRoutes.payment.name,
              builder: (context, state) => PaymentScreen()),

          /// Dish Screen
          GoRoute(
              path: AppRoutes.dish.path,
              name: AppRoutes.dish.name,
              builder: (context, state) {
                FoodItem item = state.extra as FoodItem;
                return DishScreen(item: item);
              }),

          /// Delivery Screen
          GoRoute(
              path: AppRoutes.delivery.path,
              name: AppRoutes.delivery.name,
              builder: (context, state) => DeliveryAddressScreen()),

          /// Order Summary Screen
          GoRoute(
              path: AppRoutes.orderSummary.path,
              name: AppRoutes.orderSummary.name,
              builder: (context, state) {
                Address address = state.extra as Address;
                return OrderSummaryScreen(address: address,);
              }),
        ]),
  ]);
}
