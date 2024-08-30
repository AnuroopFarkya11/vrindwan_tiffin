import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/screen/cart/repository/cart_repository.dart';
import 'package:vrindavantiffin/src/screen/cart/state/cart_state.dart';

class CartProvider extends StateNotifier<CartState> {
  CartRepository repository;

  CartProvider({required this.repository})
      : super(CartState(status: CartStatus.initial));




  Future<void> getCartItems() async {
    List<FoodItem> items = await repository.getItems();
    if (items.isEmpty)
      state = state.copyWith(status: CartStatus.empty);
    else {
      state = state.copyWith(status: CartStatus.filled);
    }
  }

  Future<void> addItemToCart(FoodItem item) async {
    await repository.addItem(item);
  }
}
