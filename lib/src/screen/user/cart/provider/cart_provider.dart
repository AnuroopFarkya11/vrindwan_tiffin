import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/screen/user/cart/model/cart_entry.dart';
import 'package:vrindavantiffin/src/screen/user/cart/repository/cart_repository.dart';
import 'package:vrindavantiffin/src/screen/user/cart/service/cart_service.dart';
import 'package:vrindavantiffin/src/screen/user/cart/state/cart_state.dart';

final _logger = Logger("CartProvider");
final cartProvider = StateNotifierProvider<CartProvider, CartState>((ref) {
  CartService service = new CartService();
  return CartProvider(service: service);
});

class CartProvider extends StateNotifier<CartState> {
  CartService service;

  CartProvider({required this.service})
      : super(CartState(status: CartStatus.initial)) {
    getCartItems();
  }

  Future<void> getCartItems() async {
    List<CartEntry> entries = await service.getEntries();
    double total = await service.sumTotal();
    _logger.log("Cart total : ${total}");
    if (entries.isEmpty)
      state = state.copyWith(status: CartStatus.empty);
    else {
      state = state.copyWith(
          status: CartStatus.filled, entries: entries, total: total);
    }
  }

  Future<void> placeItemToCart(FoodItem item, int quantity) async {
    if (quantity != 0) {
      await service.addItem(item, quantity: quantity);
    } else {
      await service.removeItem(item);
    }
    List<CartEntry> items = await service.getEntries();

    if (items.isNotEmpty) {
      double total = await service.sumTotal();
      state = state.copyWith(
          status: CartStatus.filled, entries: items, total: total);
    } else {
      state = state.copyWith(status: CartStatus.empty, entries: items);
    }
  }

  int getItemQty(FoodItem item) {
    int cnt = 0;
    Future.microtask(() async {
      cnt = await service.getItemQuantity(item);
    });
    return cnt;
  }
}
