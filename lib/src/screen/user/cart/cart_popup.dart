import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';

class CartPopup extends StatelessWidget {
  final bool isVisible;

  CartPopup({required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Positioned(
      bottom: kBottomNavigationBarHeight, // Position just above nav bar
      left: 0,
      right: 0,
      child: Card(
        color: appTheme.orangeA700,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: (){
            context.goNamed(AppRoutes.cart.name);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'Cart',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    )
        : SizedBox.shrink(); // Hide when isVisible is false
  }
}