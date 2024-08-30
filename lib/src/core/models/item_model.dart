import 'package:equatable/equatable.dart';

class FoodItem extends Equatable {
  /// Unique identifier for the food item.
  final String id;

  /// Name of the food item.
  final String name;

  /// Description of the food item.
  final String description;

  /// Price of the food item.
  final double price;

  /// URL to the image of the food item.
  final String imageUrl;

  /// Availability status of the food item.
  final bool isAvailable;

  /// Quantity available (if applicable).
  final int quantity;

  /// Category of the food item (e.g., vegetarian, non-vegetarian).
  final String category;

  /// Timestamp of when the food item was created.
  final DateTime createdAt;

  /// Timestamp of when the food item was last updated.
  final DateTime updatedAt;

  /// Indicates whether the food item is part of a special offer or promotion.
  final bool isOnOffer;

  /// Discount applied to the food item, if any.
  final double discount;

  /// Estimated preparation time in minutes.
  final int preparationTime;

  /// Nutritional information (e.g., calories, protein, fat).
  final Map<String, dynamic> nutritionalInfo;

  /// User ratings for the food item.
  final double averageRating;

  /// Total number of reviews for the food item.
  final int reviewCount;

  /// The origin or cuisine of the food item (e.g., Indian, Chinese).
  final String cuisine;

  /// The type of meal (e.g., breakfast, lunch, dinner).
  final String mealType;

  /// Tags or keywords associated with the food item (e.g., spicy, gluten-free).
  final List<String> tags;

  /// Boolean to indicate if the food item is a daily special.
  final bool isDailySpecial;

  /// Boolean to indicate if the food item is customizable (e.g., toppings).
  final bool isCustomizable;

  /// User comments or special instructions related to the food item.
  late final String specialInstructions;

  /// List of ingredients used in the food item.
  final List<String> ingredients;

  /// Boolean to indicate if the food item is part of a meal plan or combo.
  final bool isPartOfMealPlan;

  /// The weight of the food item (if applicable).
  final double weight;

  /// The serving size of the food item.
  final String servingSize;

  /// Boolean to indicate if the food item is suitable for a specific diet (e.g., keto, paleo).
  final bool isDietFriendly;

  /// List of allergens present in the food item.
  final List<String> allergens;

  /// Estimated calories for the food item.
  final int calories;

  /// The type of container used for the food item (e.g., box, bag).
  final String containerType;

  /// The cost of packaging if any.
  final double packagingCost;

  /// Boolean to indicate if the food item can be ordered for takeout.
  final bool isAvailableForTakeout;

  /// Boolean to indicate if the food item can be ordered for delivery.
  final bool isAvailableForDelivery;

  /// Boolean to indicate if the food item is available for pickup.
  final bool isAvailableForPickup;

  /// The average preparation time for large orders of this item.
  final int largeOrderPreparationTime;

  /// The maximum number of units that can be ordered at once.
  final int maxOrderQuantity;

  /// Timestamp of when the food item will next be available.
  final DateTime nextAvailableDate;

  /// Boolean to indicate if the food item is part of a seasonal menu.
  final bool isSeasonal;

  /// Creates a [FoodItem] instance.
  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isAvailable,
    this.quantity = 0,
    this.category = '',
    DateTime? createdAt,
    DateTime? updatedAt,
    this.isOnOffer = false,
    this.discount = 0.0,
    this.preparationTime = 0,
    Map<String, dynamic>? nutritionalInfo,
    this.averageRating = 0.0,
    this.reviewCount = 0,
    this.cuisine = '',
    this.mealType = '',
    List<String>? tags,
    this.isDailySpecial = false,
    this.isCustomizable = false,
    this.specialInstructions = '',
    List<String>? ingredients,
    this.isPartOfMealPlan = false,
    this.weight = 0.0,
    this.servingSize = '',
    this.isDietFriendly = false,
    List<String>? allergens,
    this.calories = 0,
    this.containerType = '',
    this.packagingCost = 0.0,
    this.isAvailableForTakeout = false,
    this.isAvailableForDelivery = false,
    this.isAvailableForPickup = false,
    this.largeOrderPreparationTime = 0,
    this.maxOrderQuantity = 0,
    DateTime? nextAvailableDate,
    this.isSeasonal = false,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now(),
        this.nutritionalInfo = nutritionalInfo ?? {},
        this.tags = tags ?? [],
        this.ingredients = ingredients ?? [],
        this.allergens = allergens ?? [],
        this.nextAvailableDate = nextAvailableDate ?? DateTime.now();

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    price,
    imageUrl,
    isAvailable,
    quantity,
    category,
    createdAt,
    updatedAt,
    isOnOffer,
    discount,
    preparationTime,
    nutritionalInfo,
    averageRating,
    reviewCount,
    cuisine,
    mealType,
    tags,
    isDailySpecial,
    isCustomizable,
    specialInstructions,
    ingredients,
    isPartOfMealPlan,
    weight,
    servingSize,
    isDietFriendly,
    allergens,
    calories,
    containerType,
    packagingCost,
    isAvailableForTakeout,
    isAvailableForDelivery,
    isAvailableForPickup,
    largeOrderPreparationTime,
    maxOrderQuantity,
    nextAvailableDate,
    isSeasonal,
  ];

  /// Converts the [FoodItem] to a map for storage or serialization.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'quantity': quantity,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isOnOffer': isOnOffer,
      'discount': discount,
      'preparationTime': preparationTime,
      'nutritionalInfo': nutritionalInfo,
      'averageRating': averageRating,
      'reviewCount': reviewCount,
      'cuisine': cuisine,
      'mealType': mealType,
      'tags': tags,
      'isDailySpecial': isDailySpecial,
      'isCustomizable': isCustomizable,
      'specialInstructions': specialInstructions,
      'ingredients': ingredients,
      'isPartOfMealPlan': isPartOfMealPlan,
      'weight': weight,
      'servingSize': servingSize,
      'isDietFriendly': isDietFriendly,
      'allergens': allergens,
      'calories': calories,
      'containerType': containerType,
      'packagingCost': packagingCost,
      'isAvailableForTakeout': isAvailableForTakeout,
      'isAvailableForDelivery': isAvailableForDelivery,
      'isAvailableForPickup': isAvailableForPickup,
      'largeOrderPreparationTime': largeOrderPreparationTime,
      'maxOrderQuantity': maxOrderQuantity,
      'nextAvailableDate': nextAvailableDate.toIso8601String(),
      'isSeasonal': isSeasonal,
    };
  }

  /// Creates a [FoodItem] from a map.
  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      isAvailable: map['isAvailable'],
      quantity: map['quantity'] ?? 0,
      category: map['category'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      isOnOffer: map['isOnOffer'] ?? false,
      discount: (map['discount'] as num?)?.toDouble() ?? 0.0,
      preparationTime: map['preparationTime'] ?? 0,
      nutritionalInfo: Map<String, dynamic>.from(map['nutritionalInfo'] ?? {}),
      averageRating: (map['averageRating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: map['reviewCount'] ?? 0,
      cuisine: map['cuisine'] ?? '',
      mealType: map['mealType'] ?? '',
      tags: List<String>.from(map['tags'] ?? []),
      isDailySpecial: map['isDailySpecial'] ?? false,
      isCustomizable: map['isCustomizable'] ?? false,
      specialInstructions: map['specialInstructions'] ?? '',
      ingredients: List<String>.from(map['ingredients'] ?? []),
      isPartOfMealPlan: map['isPartOfMealPlan'] ?? false,
      weight: (map['weight'] as num?)?.toDouble() ?? 0.0,
      servingSize: map['servingSize'] ?? '',
      isDietFriendly: map['isDietFriendly'] ?? false,
      allergens: List<String>.from(map['allergens'] ?? []),
      calories: map['calories'] ?? 0,
      containerType: map['containerType'] ?? '',
      packagingCost: (map['packagingCost'] as num?)?.toDouble() ?? 0.0,
      isAvailableForTakeout: map['isAvailableForTakeout'] ?? false,
      isAvailableForDelivery: map['isAvailableForDelivery'] ?? false,
      isAvailableForPickup: map['isAvailableForPickup'] ?? false,
      largeOrderPreparationTime: map['largeOrderPreparationTime'] ?? 0,
      maxOrderQuantity: map['maxOrderQuantity'] ?? 0,
      nextAvailableDate: DateTime.parse(map['nextAvailableDate']),
      isSeasonal: map['isSeasonal'] ?? false,
    );
  }
}
