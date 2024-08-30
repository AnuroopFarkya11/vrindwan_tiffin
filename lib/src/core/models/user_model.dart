import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  /// Unique identifier for the user.
  final String id;

  /// User's phone number.
  final String phoneNumber;

  /// User's display name.
  final String displayName;

  /// URL to the user's profile picture.
  final String photoUrl;

  /// Timestamp of when the user account was created.
  final DateTime createdAt;

  /// Timestamp of when the user account was last updated.
  final DateTime updatedAt;

  /// Boolean to check if the user's phone number is verified.
  final bool isPhoneNumberVerified;

  /// User's delivery address.
  final String address;

  /// User's preferred delivery time.
  final String preferredDeliveryTime;

  /// Boolean indicating if the user has opted for premium delivery service.
  final bool isPremiumUser;

  /// User's dietary preferences or restrictions (e.g., vegetarian, vegan, gluten-free).
  final String dietaryPreferences;

  /// User's favorite dishes or cuisines.
  final List<String> favoriteDishes;

  /// User's delivery instructions (e.g., leave at the door).
  final String deliveryInstructions;

  /// User's subscription status for tiffin plans (e.g., monthly, weekly).
  final String subscriptionStatus;

  /// Total number of deliveries made to the user.
  final int totalDeliveries;

  /// Total amount spent by the user on tiffin services.
  final double totalSpent;

  /// The user's preferred payment method (e.g., cash, card).
  final String paymentMethod;

  /// Boolean indicating if the user has any ongoing complaints or issues.
  final bool hasComplaints;

  /// User's average rating for the tiffin service.
  final double averageRating;

  /// User's membership level (e.g., basic, silver, gold).
  final String membershipLevel;

  /// Last order date.
  final DateTime lastOrderDate;

  /// List of past order IDs.
  final List<String> pastOrderIds;

  /// User's preferred tiffin package or plan.
  final String preferredTiffinPackage;

  /// User's special requests or additional preferences.
  final String specialRequests;

  /// Timestamp of the user's last login.
  final DateTime lastLogin;

  /// User's location coordinates (latitude and longitude).
  final Map<String, double> locationCoordinates;

  /// Boolean indicating if the user is an admin or has special privileges.
  final bool isAdmin;

  /// Creates a [UserModel] instance.
  UserModel({
    required this.id,
    required this.phoneNumber,
    this.displayName = '',
    this.photoUrl = '',
    DateTime? createdAt,
    DateTime? updatedAt,
    this.isPhoneNumberVerified = false,
    this.address = '',
    this.preferredDeliveryTime = '',
    this.isPremiumUser = false,
    this.dietaryPreferences = '',
    List<String>? favoriteDishes,
    this.deliveryInstructions = '',
    this.subscriptionStatus = '',
    this.totalDeliveries = 0,
    this.totalSpent = 0.0,
    this.paymentMethod = '',
    this.hasComplaints = false,
    this.averageRating = 0.0,
    this.membershipLevel = '',
    DateTime? lastOrderDate,
    List<String>? pastOrderIds,
    this.preferredTiffinPackage = '',
    this.specialRequests = '',
    DateTime? lastLogin,
    Map<String, double>? locationCoordinates,
    this.isAdmin = false,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now(),
        this.favoriteDishes = favoriteDishes ?? [],
        this.lastOrderDate = lastOrderDate ?? DateTime.now(),
        this.pastOrderIds = pastOrderIds ?? [],
        this.lastLogin = lastLogin ?? DateTime.now(),
        this.locationCoordinates = locationCoordinates ?? {};

  /// Creates a [UserModel] from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      displayName: json['displayName'] as String? ?? '',
      photoUrl: json['photoUrl'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isPhoneNumberVerified: json['isPhoneNumberVerified'] as bool? ?? false,
      address: json['address'] as String? ?? '',
      preferredDeliveryTime: json['preferredDeliveryTime'] as String? ?? '',
      isPremiumUser: json['isPremiumUser'] as bool? ?? false,
      dietaryPreferences: json['dietaryPreferences'] as String? ?? '',
      favoriteDishes: List<String>.from(json['favoriteDishes'] ?? []),
      deliveryInstructions: json['deliveryInstructions'] as String? ?? '',
      subscriptionStatus: json['subscriptionStatus'] as String? ?? '',
      totalDeliveries: json['totalDeliveries'] as int? ?? 0,
      totalSpent: (json['totalSpent'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String? ?? '',
      hasComplaints: json['hasComplaints'] as bool? ?? false,
      averageRating: (json['averageRating'] as num).toDouble(),
      membershipLevel: json['membershipLevel'] as String? ?? '',
      lastOrderDate: DateTime.parse(json['lastOrderDate'] as String),
      pastOrderIds: List<String>.from(json['pastOrderIds'] ?? []),
      preferredTiffinPackage: json['preferredTiffinPackage'] as String? ?? '',
      specialRequests: json['specialRequests'] as String? ?? '',
      lastLogin: DateTime.parse(json['lastLogin'] as String),
      locationCoordinates: Map<String, double>.from(json['locationCoordinates'] ?? {}),
      isAdmin: json['isAdmin'] as bool? ?? false,
    );
  }

  /// Converts a [UserModel] to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isPhoneNumberVerified': isPhoneNumberVerified,
      'address': address,
      'preferredDeliveryTime': preferredDeliveryTime,
      'isPremiumUser': isPremiumUser,
      'dietaryPreferences': dietaryPreferences,
      'favoriteDishes': favoriteDishes,
      'deliveryInstructions': deliveryInstructions,
      'subscriptionStatus': subscriptionStatus,
      'totalDeliveries': totalDeliveries,
      'totalSpent': totalSpent,
      'paymentMethod': paymentMethod,
      'hasComplaints': hasComplaints,
      'averageRating': averageRating,
      'membershipLevel': membershipLevel,
      'lastOrderDate': lastOrderDate.toIso8601String(),
      'pastOrderIds': pastOrderIds,
      'preferredTiffinPackage': preferredTiffinPackage,
      'specialRequests': specialRequests,
      'lastLogin': lastLogin.toIso8601String(),
      'locationCoordinates': locationCoordinates,
      'isAdmin': isAdmin,
    };
  }

  @override
  List<Object?> get props => [
    id,
    phoneNumber,
    displayName,
    photoUrl,
    createdAt,
    updatedAt,
    isPhoneNumberVerified,
    address,
    preferredDeliveryTime,
    isPremiumUser,
    dietaryPreferences,
    favoriteDishes,
    deliveryInstructions,
    subscriptionStatus,
    totalDeliveries,
    totalSpent,
    paymentMethod,
    hasComplaints,
    averageRating,
    membershipLevel,
    lastOrderDate,
    pastOrderIds,
    preferredTiffinPackage,
    specialRequests,
    lastLogin,
    locationCoordinates,
    isAdmin,
  ];
}
