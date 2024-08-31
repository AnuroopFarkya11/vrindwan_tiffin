import 'package:vrindavantiffin/src/core/models/item_model.dart';

enum CartStatus { initial, empty, filled, loading }

class CartState {
  CartStatus status;
  List<FoodItem>? items;
  String? message;

  CartState({required this.status, this.message, this.items});

  CartState copyWith(
      {CartStatus? status, List<FoodItem>? items, String? message}) {
    return CartState(
        status: status ?? this.status,
        items: items,
        message: message ?? this.message);
  }
}
