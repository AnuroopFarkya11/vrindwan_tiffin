import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/screen/user/cart/model/cart_entry.dart';
import 'package:vrindavantiffin/src/screen/user/cart/repository/cart_repository.dart';

final _logger = Logger("CartService");

class CartService extends CartRepository {
  final Map<String, CartEntry> _items = {};

  @override
  Future<void> addItem(FoodItem item, {int quantity = 1}) async {
    if (_items.containsKey(item.id)) {
      _items[item.id]!.quantity = quantity;
    } else {
      _items[item.id] = CartEntry(item: item, quantity: quantity);
    }
  }

  @override
  Future<void> removeItem(FoodItem item, {int quantity = 1}) async {
    if (_items.containsKey(item.id)) {
      if (_items[item.id]!.quantity > quantity) {
        _items[item.id]!.quantity -= quantity;
      } else {
        _items.remove(item.id);
      }
    }
  }

  @override
  Future<List<FoodItem>> getItems() async {
    return _items.values.map((entry) => entry.item).toList();
  }

  @override
  Future<List<CartEntry>> getEntries() async {
    return _items.values.map((entry) => entry).toList();
  }

  @override
  Future<int> getItemQuantity(FoodItem item) async {
    return _items[item.id]?.quantity ?? 0;
  }

  @override
  Future<double> sumTotal() async {
    return _items.values.fold<double>(
      0.0,
      (total, entry) => total + (entry.item.price * entry.quantity),
    );
  }

  @override
  Future<bool> isInCart(FoodItem item) async {
    return _items.containsKey(item.id);
  }

  @override
  Future<void> clearCart() async {
    _items.clear();
  }

  @override
  Future<int> getItemCount() async {
    return _items.length;
  }

  @override
  Future<void> updateItemQuantity(FoodItem item, int quantity) async {
    if (quantity <= 0) {
      _items.remove(item.id);
    } else if (_items.containsKey(item.id)) {
      _items[item.id]!.quantity = quantity;
    }
  }

/*
  Future<void> applyDiscountCode(String code) async {

    for (var entry in _items.values) {
      entry.item.price *= 0.9;
    }
  }*/

  /*
  Future<Map<String, double>> calculateNutrition() async {
    double totalCalories = 0;
    double totalProtein = 0;
    double totalFat = 0;

    for (var entry in _items.values) {
      totalCalories += entry.item.calories * entry.quantity;
      totalProtein += entry.item.protein * entry.quantity;
      totalFat += entry.item.fat * entry.quantity;
    }

    return {
      'calories': totalCalories,
      'protein': totalProtein,
      'fat': totalFat,
    };
  }*/

  @override
  Future<void> addSpecialInstructions(
      FoodItem item, String instructions) async {
    if (_items.containsKey(item.id)) {
      _items[item.id]!.item.specialInstructions = instructions;
    }
  }

  @override
  Future<Duration> calculateDeliveryTime() async {
    int totalPreparationTime =
        _items.values.fold(0, (total, entry) => total + (10 * entry.quantity));
    return Duration(minutes: totalPreparationTime);
  }
}
