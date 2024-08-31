import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/screen/cart/repository/cart_repository.dart';
import 'package:vrindavantiffin/src/screen/cart/service/cart_service.dart';
import 'package:vrindavantiffin/src/screen/cart/state/cart_state.dart';

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
    List<FoodItem> items = await service.getItems();
    if (items.isEmpty)
      state = state.copyWith(status: CartStatus.empty);
    else {
      state = state.copyWith(status: CartStatus.filled);
    }
  }

  Future<void> placeItemToCart(FoodItem item, int quantity) async {
    if (quantity != 0) {
      await service.addItem(item, quantity: quantity);
    } else {
      await service.removeItem(item);
    }
    List<FoodItem> items = await service.getItems();

    if (items.isNotEmpty) {
      state = state.copyWith(status: CartStatus.filled, items: items);
    } else {
      state = state.copyWith(status: CartStatus.empty, items: items);
    }
  }
}
