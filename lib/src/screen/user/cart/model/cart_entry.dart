import 'package:vrindavantiffin/src/core/models/item_model.dart';

class CartEntry {
  final FoodItem item;
  int quantity;

  CartEntry({required this.item, required this.quantity});

  // From JSON
  factory CartEntry.fromJson(Map<String, dynamic> json) => CartEntry(
    item: FoodItem.fromJson(json['item'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
  );

  // To JSON
  Map<String, dynamic> toJson() => {
    'item': item.toJson(),
    'quantity': quantity,
  };
}
