import 'package:vrindavantiffin/src/core/models/id.dart';

class FoodItem {
  FoodItem({
    Id? id,
    String? foodName,
    String? hindiName,
    String? description,
    String? hindiDescription,
    num? price,
    String? imageUrl,
    bool? isAvailable,
    num? quantity,
    String? category,
    bool? isOnOffer,
    num? discount,
    num? preparationTime,
    NutritionalInfo? nutritionalInfo,
    num? averageRating,
    num? reviewCount,
    String? cuisine,
    String? mealType,
    List<String>? tags,
    bool? isDailySpecial,
    bool? isCustomizable,
    String? specialInstructions,
    List<String>? ingredients,
    bool? isPartOfMealPlan,
    num? weight,
    String? servingSize,
    bool? isDietFriendly,
    List<String>? allergens,
    String? containerType,
    num? packagingCost,
    bool? isAvailableForTakeout,
    bool? isAvailableForDelivery,
    bool? isAvailableForPickup,
    num? largeOrderPreparationTime,
    num? maxOrderQuantity,
    String? nextAvailableDate,
    bool? isSeasonal,
  }) {
    _id = id;
    _name = foodName;
    _hindiName = hindiName;
    _description = description;
    _hindiDescription = hindiDescription;
    _price = price;
    _imageUrl = imageUrl;
    _isAvailable = isAvailable;
    _quantity = quantity;
    _category = category;
    _isOnOffer = isOnOffer;
    _discount = discount;
    _preparationTime = preparationTime;
    _nutritionalInfo = nutritionalInfo;
    _averageRating = averageRating;
    _reviewCount = reviewCount;
    _cuisine = cuisine;
    _mealType = mealType;
    _tags = tags;
    _isDailySpecial = isDailySpecial;
    _isCustomizable = isCustomizable;
    _specialInstructions = specialInstructions;
    _ingredients = ingredients;
    _isPartOfMealPlan = isPartOfMealPlan;
    _weight = weight;
    _servingSize = servingSize;
    _isDietFriendly = isDietFriendly;
    _allergens = allergens;
    _containerType = containerType;
    _packagingCost = packagingCost;
    _isAvailableForTakeout = isAvailableForTakeout;
    _isAvailableForDelivery = isAvailableForDelivery;
    _isAvailableForPickup = isAvailableForPickup;
    _largeOrderPreparationTime = largeOrderPreparationTime;
    _maxOrderQuantity = maxOrderQuantity;
    _nextAvailableDate = nextAvailableDate;
    _isSeasonal = isSeasonal;
  }

  FoodItem.fromJson(dynamic json) {
    _id = Id.fromJson(json['id']);
    _name = json['foodName'];
    _hindiName = json['hindiName'];
    _description = json['description'];
    _hindiDescription = json['hindiDescription'];
    _price = json['price'];
    _imageUrl = json['imageUrl'];
    _isAvailable = json['isAvailable'];
    _quantity = json['quantity'];
    _category = json['category'];
    _isOnOffer = json['isOnOffer'];
    _discount = json['discount'];
    _preparationTime = json['preparationTime'];
    _nutritionalInfo = json['nutritionalInfo'] != null
        ? NutritionalInfo.fromJson(json['nutritionalInfo'])
        : null;
    _averageRating = json['averageRating'];
    _reviewCount = json['reviewCount'];
    _cuisine = json['cuisine'];
    _mealType = json['mealType'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _isDailySpecial = json['isDailySpecial'];
    _isCustomizable = json['isCustomizable'];
    _specialInstructions = json['specialInstructions'];
    _ingredients =
        json['ingredients'] != null ? json['ingredients'].cast<String>() : [];
    _isPartOfMealPlan = json['isPartOfMealPlan'];
    _weight = json['weight'];
    _servingSize = json['servingSize'];
    _isDietFriendly = json['isDietFriendly'];
    _allergens =
        json['allergens'] != null ? json['allergens'].cast<String>() : [];
    _containerType = json['containerType'];
    _packagingCost = json['packagingCost'];
    _isAvailableForTakeout = json['isAvailableForTakeout'];
    _isAvailableForDelivery = json['isAvailableForDelivery'];
    _isAvailableForPickup = json['isAvailableForPickup'];
    _largeOrderPreparationTime = json['largeOrderPreparationTime'];
    _maxOrderQuantity = json['maxOrderQuantity'];
    _nextAvailableDate = json['nextAvailableDate'];
    _isSeasonal = json['isSeasonal'];
  }

  Id? _id;
  String? _name;
  String? _hindiName;
  String? _description;
  String? _hindiDescription;
  num? _price;
  String? _imageUrl;
  bool? _isAvailable;
  num? _quantity;
  String? _category;
  bool? _isOnOffer;
  num? _discount;
  num? _preparationTime;
  NutritionalInfo? _nutritionalInfo;
  num? _averageRating;
  num? _reviewCount;
  String? _cuisine;
  String? _mealType;
  List<String>? _tags;
  bool? _isDailySpecial;
  bool? _isCustomizable;
  String? _specialInstructions;
  List<String>? _ingredients;
  bool? _isPartOfMealPlan;
  num? _weight;
  String? _servingSize;
  bool? _isDietFriendly;
  List<String>? _allergens;
  String? _containerType;
  num? _packagingCost;
  bool? _isAvailableForTakeout;
  bool? _isAvailableForDelivery;
  bool? _isAvailableForPickup;
  num? _largeOrderPreparationTime;
  num? _maxOrderQuantity;
  String? _nextAvailableDate;
  bool? _isSeasonal;

  FoodItem copyWith({
    Id? id,
    String? name,
    String? hindiName,
    String? description,
    String? hindiDescription,
    num? price,
    String? imageUrl,
    bool? isAvailable,
    num? quantity,
    String? category,
    bool? isOnOffer,
    num? discount,
    num? preparationTime,
    NutritionalInfo? nutritionalInfo,
    num? averageRating,
    num? reviewCount,
    String? cuisine,
    String? mealType,
    List<String>? tags,
    bool? isDailySpecial,
    bool? isCustomizable,
    String? specialInstructions,
    List<String>? ingredients,
    bool? isPartOfMealPlan,
    num? weight,
    String? servingSize,
    bool? isDietFriendly,
    List<String>? allergens,
    String? containerType,
    num? packagingCost,
    bool? isAvailableForTakeout,
    bool? isAvailableForDelivery,
    bool? isAvailableForPickup,
    num? largeOrderPreparationTime,
    num? maxOrderQuantity,
    String? nextAvailableDate,
    bool? isSeasonal,
  }) =>
      FoodItem(
        id: id ?? _id,
        foodName: name ?? _name,
        hindiName: hindiName ?? _hindiName,
        description: description ?? _description,
        hindiDescription: hindiDescription ?? _hindiDescription,
        price: price ?? _price,
        imageUrl: imageUrl ?? _imageUrl,
        isAvailable: isAvailable ?? _isAvailable,
        quantity: quantity ?? _quantity,
        category: category ?? _category,
        isOnOffer: isOnOffer ?? _isOnOffer,
        discount: discount ?? _discount,
        preparationTime: preparationTime ?? _preparationTime,
        nutritionalInfo: nutritionalInfo ?? _nutritionalInfo,
        averageRating: averageRating ?? _averageRating,
        reviewCount: reviewCount ?? _reviewCount,
        cuisine: cuisine ?? _cuisine,
        mealType: mealType ?? _mealType,
        tags: tags ?? _tags,
        isDailySpecial: isDailySpecial ?? _isDailySpecial,
        isCustomizable: isCustomizable ?? _isCustomizable,
        specialInstructions: specialInstructions ?? _specialInstructions,
        ingredients: ingredients ?? _ingredients,
        isPartOfMealPlan: isPartOfMealPlan ?? _isPartOfMealPlan,
        weight: weight ?? _weight,
        servingSize: servingSize ?? _servingSize,
        isDietFriendly: isDietFriendly ?? _isDietFriendly,
        allergens: allergens ?? _allergens,
        containerType: containerType ?? _containerType,
        packagingCost: packagingCost ?? _packagingCost,
        isAvailableForTakeout: isAvailableForTakeout ?? _isAvailableForTakeout,
        isAvailableForDelivery:
            isAvailableForDelivery ?? _isAvailableForDelivery,
        isAvailableForPickup: isAvailableForPickup ?? _isAvailableForPickup,
        largeOrderPreparationTime:
            largeOrderPreparationTime ?? _largeOrderPreparationTime,
        maxOrderQuantity: maxOrderQuantity ?? _maxOrderQuantity,
        nextAvailableDate: nextAvailableDate ?? _nextAvailableDate,
        isSeasonal: isSeasonal ?? _isSeasonal,
      );

  Id? get id => _id;

  String? get name => _name;

  String? get hindiName => _hindiName;

  String? get description => _description;

  String? get hindiDescription => _hindiDescription;

  num? get price => _price;

  String? get imageUrl => _imageUrl;

  bool? get isAvailable => _isAvailable;

  num? get quantity => _quantity;

  String? get category => _category;

  bool? get isOnOffer => _isOnOffer;

  num? get discount => _discount;

  num? get preparationTime => _preparationTime;

  NutritionalInfo? get nutritionalInfo => _nutritionalInfo;

  num? get averageRating => _averageRating;

  num? get reviewCount => _reviewCount;

  String? get cuisine => _cuisine;

  String? get mealType => _mealType;

  List<String>? get tags => _tags;

  bool? get isDailySpecial => _isDailySpecial;

  bool? get isCustomizable => _isCustomizable;

  String? get specialInstructions => _specialInstructions;

  List<String>? get ingredients => _ingredients;

  bool? get isPartOfMealPlan => _isPartOfMealPlan;

  num? get weight => _weight;

  String? get servingSize => _servingSize;

  bool? get isDietFriendly => _isDietFriendly;

  List<String>? get allergens => _allergens;

  String? get containerType => _containerType;

  num? get packagingCost => _packagingCost;

  bool? get isAvailableForTakeout => _isAvailableForTakeout;

  bool? get isAvailableForDelivery => _isAvailableForDelivery;

  bool? get isAvailableForPickup => _isAvailableForPickup;

  num? get largeOrderPreparationTime => _largeOrderPreparationTime;

  num? get maxOrderQuantity => _maxOrderQuantity;

  String? get nextAvailableDate => _nextAvailableDate;

  bool? get isSeasonal => _isSeasonal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id?.toJson();
    map['foodName'] = _name;
    map['hindiName'] = _hindiName;
    map['description'] = _description;
    map['hindiDescription'] = _hindiDescription;
    map['price'] = _price;
    map['imageUrl'] = _imageUrl;
    map['isAvailable'] = _isAvailable;
    map['quantity'] = _quantity;
    map['category'] = _category;
    map['isOnOffer'] = _isOnOffer;
    map['discount'] = _discount;
    map['preparationTime'] = _preparationTime;
    if (_nutritionalInfo != null) {
      map['nutritionalInfo'] = _nutritionalInfo?.toJson();
    }
    map['averageRating'] = _averageRating;
    map['reviewCount'] = _reviewCount;
    map['cuisine'] = _cuisine;
    map['mealType'] = _mealType;
    map['tags'] = _tags;
    map['isDailySpecial'] = _isDailySpecial;
    map['isCustomizable'] = _isCustomizable;
    map['specialInstructions'] = _specialInstructions;
    map['ingredients'] = _ingredients;
    map['isPartOfMealPlan'] = _isPartOfMealPlan;
    map['weight'] = _weight;
    map['servingSize'] = _servingSize;
    map['isDietFriendly'] = _isDietFriendly;
    map['allergens'] = _allergens;
    map['containerType'] = _containerType;
    map['packagingCost'] = _packagingCost;
    map['isAvailableForTakeout'] = _isAvailableForTakeout;
    map['isAvailableForDelivery'] = _isAvailableForDelivery;
    map['isAvailableForPickup'] = _isAvailableForPickup;
    map['largeOrderPreparationTime'] = _largeOrderPreparationTime;
    map['maxOrderQuantity'] = _maxOrderQuantity;
    map['nextAvailableDate'] = _nextAvailableDate;
    map['isSeasonal'] = _isSeasonal;
    return map;
  }
}

/// calories : 900
/// proteins : 30
/// carbs : 120
/// fats : 20

class NutritionalInfo {
  NutritionalInfo({
    num? calories,
    num? proteins,
    num? carbs,
    num? fats,
  }) {
    _calories = calories;
    _proteins = proteins;
    _carbs = carbs;
    _fats = fats;
  }

  NutritionalInfo.fromJson(dynamic json) {
    _calories = json['calories'];
    _proteins = json['proteins'];
    _carbs = json['carbs'];
    _fats = json['fats'];
  }

  num? _calories;
  num? _proteins;
  num? _carbs;
  num? _fats;

  NutritionalInfo copyWith({
    num? calories,
    num? proteins,
    num? carbs,
    num? fats,
  }) =>
      NutritionalInfo(
        calories: calories ?? _calories,
        proteins: proteins ?? _proteins,
        carbs: carbs ?? _carbs,
        fats: fats ?? _fats,
      );

  num? get calories => _calories;

  num? get proteins => _proteins;

  num? get carbs => _carbs;

  num? get fats => _fats;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['calories'] = _calories;
    map['proteins'] = _proteins;
    map['carbs'] = _carbs;
    map['fats'] = _fats;
    return map;
  }
}
