import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';

import 'package:vrindavantiffin/src/screen/user/cart/model/cart_entry.dart';
import 'package:vrindavantiffin/src/screen/user/cart/provider/cart_provider.dart';

class FoodItemTile extends ConsumerStatefulWidget {
  final CartEntry entry;

  const FoodItemTile({super.key, required this.entry});

  @override
  ConsumerState<FoodItemTile> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends ConsumerState<FoodItemTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Text(widget.entry.item.name),
      subtitle: Text(
          "${widget.entry.item.price} x ${widget.entry.quantity} : Rs. ${widget.entry.item.price * widget.entry.quantity} "),
      trailing: InputQty(
        initVal: widget.entry.quantity,
        isIntrinsicWidth: true,
        decoration: QtyDecorationProps(
            // width: (constraints.maxWidth * 0.3).toInt(),
            contentPadding: 10.padding),
        onQtyChanged: (val) {
          ref
              .read(cartProvider.notifier)
              .placeItemToCart(widget.entry.item, val.toInt());
        },
      ),
    );
  }
}
