import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/screen/user/cart/cart_popup.dart';
import 'package:vrindavantiffin/src/screen/user/cart/provider/cart_provider.dart';
import 'package:vrindavantiffin/src/screen/user/cart/state/cart_state.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/delivery_address.dart';
import 'package:vrindavantiffin/src/screen/user/dish/dish_view_screen.dart';
import 'package:vrindavantiffin/src/screen/user/home/home_screen.dart';
import 'package:vrindavantiffin/src/screen/user/order/order_summary_screen.dart';
import 'package:vrindavantiffin/src/screen/user/profile/profile_section_screen.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';

class UserMainScreen extends ConsumerStatefulWidget {
  const UserMainScreen({super.key});

  @override
  ConsumerState<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends ConsumerState<UserMainScreen> {
  PersistentTabController _controller = PersistentTabController();

  final List<String> _tabs = [
    AppRoutes.home.path, // "/home"
    AppRoutes.dish.path, // "/dish"
    AppRoutes.orderSummary.path, // "/order-summary"
    AppRoutes.delivery.path, // "/delivery"
  ];

  @override
  Widget build(BuildContext context) {
    final cartStatus = ref.watch(cartProvider);
    return Stack(
      children: [
        PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardAppears: true,
          padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
          // backgroundColor: Colors.grey.shade900,
          isVisible: true,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              animateTabTransition: true,
              duration: Duration(milliseconds: 200),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.fadeIn,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: kBottomNavigationBarHeight,
          navBarStyle: NavBarStyle.style9,
        ),
        CartPopup(isVisible: cartStatus.status == CartStatus.filled)
      ],
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      ProfileSectionScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        activeColorPrimary: appTheme.orangeA700,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.heart),
        activeColorPrimary: appTheme.orangeA700,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.search),
        activeColorPrimary: appTheme.orangeA700,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        activeColorPrimary: appTheme.orangeA700,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
