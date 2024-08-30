import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/screen/auth/auth_screen.dart';

class FoodItemCard extends ConsumerStatefulWidget {
  final FoodItem item;
  const FoodItemCard({super.key,required this.item});

  @override
  ConsumerState<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends ConsumerState<FoodItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.all(constraints.maxWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/frenchfries.png',
                    height: constraints.maxHeight * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                Text(
                  widget.item.name,
                  style: TextStyle(fontSize: constraints.maxWidth * 0.09),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                Text(
                  widget.item.description,
                  style: TextStyle(fontSize: constraints.maxWidth * 0.08),
                ),
                Spacer(),
                Center(
                  child: InputQty(
                    initVal: 0,
                    isIntrinsicWidth: true,
                    decoration: QtyDecorationProps(
                      width: (constraints.maxWidth * 0.3).toInt(),
                      contentPadding: EdgeInsets.all(constraints.maxWidth * 0.02),
                    ),
                    onQtyChanged: (val) {},
                  ),
                )
              ],
            ),
          );
        },
      ),
    );

  }
}
