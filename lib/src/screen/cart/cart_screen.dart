import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/screen/cart/provider/cart_provider.dart';
import 'package:vrindavantiffin/src/screen/cart/state/cart_state.dart';
import 'package:vrindavantiffin/src/screen/cart/widget/item_tile.dart';
import 'package:triton_extensions/triton_extensions.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Text('Food Cart'),
    );
  }

  _getBody() {
    final cart = ref.watch(cartProvider);

    switch (cart.status) {
      case CartStatus.empty:
        {
          return Center(
            child: Text("Your Cart Is Empty."),
          );
        }
      case CartStatus.filled:
        {
          return Padding(
            padding: 8.padding,
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: cart.entries?.length,
                    itemBuilder: (context, index) {
                      return FoodItemTile(entry: cart.entries![index]);
                    }),
                Row(
                  children: [
                    Text(
                      "Total :",
                      style: context.textTheme.titleLarge,
                    ),
                    Spacer(),
                    Text(
                      "${cart.total}",
                      style: context.textTheme.titleLarge,
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      context.pushNamed(AppRoutes.payment.name);
                    },
                    child: Text('Next'))
              ],
            ),
          );
        }
      default:
        {
          return SizedBox.shrink();
        }
    }
  }
}
