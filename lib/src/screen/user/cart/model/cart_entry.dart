import 'package:vrindavantiffin/src/core/models/item_model.dart';

class CartEntry {
  final FoodItem item;
  int quantity;

  CartEntry({required this.item, required this.quantity});
}
