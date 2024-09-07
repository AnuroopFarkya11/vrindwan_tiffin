import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/screen/user/cart/model/cart_entry.dart';

enum CartStatus { initial, empty, filled, loading }

class CartState {
  CartStatus status;
  List<CartEntry>? entries;
  double? total;
  String? message;

  CartState({required this.status, this.message, this.entries,this.total});

  CartState copyWith(
      {CartStatus? status, List<CartEntry>? entries, double? total, String? message}) {
    return CartState(
        status: status ?? this.status,
        entries: entries??this.entries,
        total: total??this.total,
        message: message ?? this.message);
  }
}
