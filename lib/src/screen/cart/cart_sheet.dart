import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/navigation/app_router.dart';
import 'package:vrindavantiffin/src/core/navigation/app_routes.dart';
import 'package:vrindavantiffin/src/screen/home/home_screen.dart';

class CartSheet extends ConsumerStatefulWidget {
  const CartSheet({super.key});

  @override
  ConsumerState<CartSheet> createState() => _CartSheetState();
}

class _CartSheetState extends ConsumerState<CartSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        backgroundColor: context.colorScheme.primary,
        constraints: BoxConstraints(maxHeight: 70,minHeight: 70),
        onClosing: () {},
        builder: (context) {
          return Container(
            padding: 20.paddingHorizontal,
            child: Row(
              children: [
                Text('Cart',style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.surfaceBright),),
                10.spaceHorizontal,
                Icon(Icons.shopping_cart,color: context.colorScheme.surfaceBright,),
                Spacer(),
                InkWell(onTap: (){
                  context.goNamed(AppRoutes.cart.name);
                },child: Text('View',style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.surfaceBright),)),

              ],
            ),
          );
        });
  }
}
