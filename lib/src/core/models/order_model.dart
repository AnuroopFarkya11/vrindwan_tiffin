import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/screen/user/cart/model/cart_entry.dart';
class Order {
  List<CartEntry>? foodItems;
  double? totalAmount;
  Address? deliveryAddress;
  String? paymentStatus;
  String? paymentMethod;
  String? orderNotes;

  Order({
    this.foodItems,
    this.totalAmount,
    this.deliveryAddress,
    this.paymentStatus,
    this.paymentMethod,
    this.orderNotes,
  });

  // From JSON
  factory Order.fromJson(Map<String, dynamic> json) => Order(
    foodItems: (json['foodItems'] as List<dynamic>?)
        ?.map((item) => CartEntry.fromJson(item as Map<String, dynamic>))
        .toList(),
    totalAmount: json['totalAmount'] as double?,
    deliveryAddress: json['deliveryAddress'] != null
        ? Address.fromJson(json['deliveryAddress'] as Map<String, dynamic>)
        : null,
    paymentStatus: json['paymentStatus'] as String?,
    paymentMethod: json['paymentMethod'] as String?,
    orderNotes: json['orderNotes'] as String?,
  );

  // To JSON
  Map<String, dynamic> toJson() => {
    'foodItems': foodItems?.map((item) => item.toJson()).toList(),
    'totalAmount': totalAmount,
    'deliveryAddress': deliveryAddress?.toJson(),
    'paymentStatus': paymentStatus,
    'paymentMethod': paymentMethod,
    'orderNotes': orderNotes,
  };
}







