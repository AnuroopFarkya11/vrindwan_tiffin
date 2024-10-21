class Address {
  dynamic id;
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

  // Factory constructor to create a DeliveryAddress object from JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      name: json['name'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postalCode'] as String,
      country: json['country'] as String,
      phoneNumber: json['phoneNumber'] as String,
      alternatePhoneNumber: json['alternatePhoneNumber'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  // Method to convert the DeliveryAddress object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'phoneNumber': phoneNumber,
      'alternatePhoneNumber': alternatePhoneNumber,
    };
  }
}
