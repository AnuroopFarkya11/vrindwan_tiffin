import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/screen/auth/provider/auth_provider.dart';
import 'package:vrindavantiffin/src/screen/user/cart/cart_sheet.dart';
import 'package:vrindavantiffin/src/screen/user/cart/provider/cart_provider.dart';
import 'package:vrindavantiffin/src/screen/user/cart/state/cart_state.dart';
import 'package:vrindavantiffin/src/screen/user/home/provider/home_provider.dart';
import 'package:vrindavantiffin/src/screen/user/home/state/home_state.dart';
import 'package:vrindavantiffin/src/screen/user/home/widget/item_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      bottomSheet: _getSheet(),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Text('Home screen'),
      actions: [
        IconButton(
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
            icon: Icon(
              Icons.login_outlined,
              color: Colors.red,
            ))
      ],
    );
  }

  _getBody() {
    final home = ref.watch(homeProvider);

    switch (home.status) {
      case (HomeStatus.loading):
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      case (HomeStatus.loaded):
        {
          return GridView.builder(
              padding: 10.padding,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              shrinkWrap: true,
              itemCount: home.items?.length ?? 0,
              itemBuilder: (context, index) {
                return FoodItemCard(
                  item: home.items![index],
                );
              });
        }
      default:
        return SizedBox.shrink();
    }
  }

  _getSheet() {

    final cart = ref.watch(cartProvider);

    switch(cart.status)
    {
      case CartStatus.filled:{

        return CartSheet();
      }
      default:{
        return SizedBox.shrink();
      }
    }




  }
}
