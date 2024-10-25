import 'package:equatable/equatable.dart';
import 'package:vrindavantiffin/src/core/models/id.dart';
import 'package:vrindavantiffin/src/core/models/order_model.dart';

class Address extends Equatable {
   Id? id;
   String? addressId;
   String? name;
   String? street;
   String? city;
   String? state;
   String? postalCode;
   String? country;
   String? phoneNumber;
   String? alternatePhoneNumber;
   DateTime? createdAt;
   DateTime? updatedAt;

  Address({
    this.id,
    this.addressId,
    this.name,
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.phoneNumber,
    this.alternatePhoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create an Address object from JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] != null ? Id.fromJson(json['id']) : null,
      addressId: json['addressId'] as String?,
      name: json['name'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      alternatePhoneNumber: json['alternatePhoneNumber'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    );
  }

  // Method to convert the Address object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toJson(),
      'addressId': addressId,
      'name': name,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'phoneNumber': phoneNumber,
      'alternatePhoneNumber': alternatePhoneNumber,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
    id,
    addressId,
    name,
    street,
    city,
    state,
    postalCode,
    country,
    phoneNumber,
    alternatePhoneNumber,
    createdAt,
    updatedAt,
  ];

  @override
  String toString() {
    return 'Address(id: $id, addressId: $addressId, name: $name, street: $street, city: $city, state: $state, postalCode: $postalCode, country: $country, phoneNumber: $phoneNumber, alternatePhoneNumber: $alternatePhoneNumber, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
