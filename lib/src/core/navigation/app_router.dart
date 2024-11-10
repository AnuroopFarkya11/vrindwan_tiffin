import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/navigation/transition_builder.dart';
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
import 'package:vrindavantiffin/src/screen/user/delivery/add_delivery_address_screen.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/delivery_address.dart';
import 'package:vrindavantiffin/src/screen/user/dish/dish_list_screen.dart';
import 'package:vrindavantiffin/src/screen/user/dish/dish_view_screen.dart';
import 'package:vrindavantiffin/src/screen/user/home/home_screen.dart';
import 'package:vrindavantiffin/src/screen/user/order/order_placed_screen.dart';
import 'package:vrindavantiffin/src/screen/user/order/order_summary_screen.dart';
import 'package:vrindavantiffin/src/screen/user/order/order_tracking_screen.dart';
import 'package:vrindavantiffin/src/screen/user/payment/payment_screen.dart';
import 'package:vrindavantiffin/src/screen/user/user_main_screen.dart';

class AppRouter {
  GoRouter get router => _router;

  final _router = GoRouter(routes: [
    GoRoute(
        path: AppRoutes.auth.path,
        name: AppRoutes.auth.name,
        builder: (context, state) => const OrderTrackingScreen(),
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
                    transitionsBuilder:
                        AppTransitionBuilder.slideTransitionRoute);
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
                  transitionsBuilder: AppTransitionBuilder.slideTransitionRoute,
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
                  transitionsBuilder: AppTransitionBuilder.slideTransitionRoute,
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
              pageBuilder: (context, state) => CustomTransitionPage(
                  child: CartNewScreen(),
                  transitionsBuilder:
                      AppTransitionBuilder.bottomTransitionRoute)),

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

          /// Dish List Screen
          GoRoute(
              path: AppRoutes.dishList.path,
              name: AppRoutes.dishList.name,
              pageBuilder: (context, state) {
                String category = state.extra as String;
                return CustomTransitionPage(
                    child: DishListScreen(
                      category: category,
                    ),
                    transitionsBuilder:
                        AppTransitionBuilder.slideTransitionRoute);
                // return ;
              }),

          /// Delivery Screen
          GoRoute(
              path: AppRoutes.delivery.path,
              name: AppRoutes.delivery.name,
              pageBuilder: (context, state) => CustomTransitionPage(
                  child: DeliveryAddressScreen(),
                  transitionsBuilder:
                      AppTransitionBuilder.slideTransitionRoute)),

          /// Add Delivery Address Screen
          GoRoute(
              path: AppRoutes.addDelivery.path,
              name: AppRoutes.addDelivery.name,
              builder: (context, state) => AddDeliveryAddressScreen()),

          /// Order Summary Screen
          GoRoute(
              path: AppRoutes.orderSummary.path,
              name: AppRoutes.orderSummary.name,
              pageBuilder: (context, state) {

                return CustomTransitionPage(
                    child: OrderSummaryScreen(),
                    transitionsBuilder:
                        AppTransitionBuilder.fadeTransitionRoute);
              }),

          /// Order Placed Screen
          GoRoute(
              path: AppRoutes.orderPlaced.path,
              name: AppRoutes.orderPlaced.name,
              builder: (context, state) => OrderPlacedScreen()),
        ]),
  ]);
}
