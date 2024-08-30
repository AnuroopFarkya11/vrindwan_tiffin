import 'package:vrindavantiffin/src/core/models/item_model.dart';

class CartRepository {
  // A Map to store items in the cart with the item ID as the key and a tuple of the FoodItem and its quantity as the value
  final Map<String, _CartEntry> _items = {};

  // Add an item to the cart
  Future<void> addItem(FoodItem item, {int quantity = 1}) async {
    if (_items.containsKey(item.id)) {
      // If item already exists in the cart, update the quantity
      _items[item.id]!.quantity += quantity;
    } else {
      // If item doesn't exist, add it to the cart
      _items[item.id] = _CartEntry(item: item, quantity: quantity);
    }
  }

  // Remove an item or decrease its quantity from the cart
  Future<void> removeItem(FoodItem item, {int quantity = 1}) async {
    if (_items.containsKey(item.id)) {
      if (_items[item.id]!.quantity > quantity) {
        // Decrease the quantity if it's greater than the quantity to be removed
        _items[item.id]!.quantity -= quantity;
      } else {
        // Remove the item entirely if the quantity is less than or equal to the quantity to be removed
        _items.remove(item.id);
      }
    }
  }

  // Get the list of all items in the cart
  Future<List<FoodItem>> getItems() async {
    return _items.values.map((entry) => entry.item).toList();
  }

  // Get the quantity of a specific item in the cart
  Future<int> getItemQuantity(FoodItem item) async {
    return _items[item.id]?.quantity ?? 0;
  }

  // Calculate the total price of items in the cart
  Future<double> sumTotal() async {
    return _items.values.fold<double>(
      0.0,
      (total, entry) => total + (entry.item.price * entry.quantity),
    );
  }

  // Check if a food item is in the cart
  Future<bool> isInCart(FoodItem item) async {
    return _items.containsKey(item.id);
  }

  // Clear all items from the cart
  Future<void> clearCart() async {
    _items.clear();
  }

  // Get the total number of distinct items in the cart
  Future<int> getItemCount() async {
    return _items.length;
  }

  // Update the quantity of a specific food item in the cart
  Future<void> updateItemQuantity(FoodItem item, int quantity) async {
    if (quantity <= 0) {
      _items.remove(item.id);
    } else if (_items.containsKey(item.id)) {
      _items[item.id]!.quantity = quantity;
    }
  }

/*  // Apply a discount or promotion to the cart
  Future<void> applyDiscountCode(String code) async {
    // For demonstration, let's assume a fixed 10% discount for any code
    for (var entry in _items.values) {
      entry.item.price *= 0.9; // Apply a 10% discount
    }
  }*/

  /*// Calculate the total nutritional values (e.g., calories, protein, etc.)
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

  // Add special instructions for food items in the cart
  Future<void> addSpecialInstructions(
      FoodItem item, String instructions) async {
    if (_items.containsKey(item.id)) {
      _items[item.id]!.item.specialInstructions = instructions;
    }
  }

  // Calculate estimated delivery time based on items in the cart
  Future<Duration> calculateDeliveryTime() async {
    // Assume each item takes 10 minutes to prepare as a base example
    int totalPreparationTime =
        _items.values.fold(0, (total, entry) => total + (10 * entry.quantity));
    return Duration(minutes: totalPreparationTime);
  }
}

// Private class to store items and their quantities
class _CartEntry {
  final FoodItem item;
  int quantity;

  _CartEntry({required this.item, required this.quantity});
}
