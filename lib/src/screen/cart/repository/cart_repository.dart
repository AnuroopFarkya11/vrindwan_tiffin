import 'package:vrindavantiffin/src/core/models/item_model.dart';

abstract class CartRepository {
  // Add an item to the cart
  Future<void> addItem(FoodItem item, {int quantity = 1});

  // Remove an item or decrease its quantity from the cart
  Future<void> removeItem(FoodItem item, {int quantity = 1});

  // Get the list of all items in the cart
  Future<List<FoodItem>> getItems();

  // Get the quantity of a specific item in the cart
  Future<int> getItemQuantity(FoodItem item);

  // Calculate the total price of items in the cart
  Future<double> sumTotal();

  // Check if a food item is in the cart
  Future<bool> isInCart(FoodItem item);

  // Clear all items from the cart
  Future<void> clearCart();

  // Get the total number of distinct items in the cart
  Future<int> getItemCount();

  // Update the quantity of a specific food item in the cart
  Future<void> updateItemQuantity(FoodItem item, int quantity);

  // Add special instructions for food items in the cart
  Future<void> addSpecialInstructions(FoodItem item, String instructions);

  // Calculate estimated delivery time based on items in the cart
  Future<Duration> calculateDeliveryTime();
}
