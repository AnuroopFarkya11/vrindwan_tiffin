/// uid : "1105021"
/// name : "RamJI"
/// userName : null
/// address : null
/// phoneNumber : 8305048847
/// password : "$2a$10$AGPlyaqXktM92aF3qhviruCkJC/m.v2t/5Hyi31MMI6XOm7hbw4bi"
/// role : "USER"
/// location : null
/// orderEntities : []
/// createdAt : "2024-10-08T20:17:49.219675652"
/// updatedAt : "2024-10-08T20:17:49.219693439"

class UserDB {
  UserDB({
    String? uid,
    String? name,
    dynamic userName,
    dynamic address,
    String? phoneNumber,
    String? password,
    String? role,
    dynamic location,
    List<dynamic>? orderEntities,
    String? createdAt,
    String? updatedAt,
  }) {
    _uid = uid;
    _name = name;
    _userName = userName;
    _address = address;
    _phoneNumber = phoneNumber;
    _password = password;
    _role = role;
    _location = location;
    _orderEntities = orderEntities;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  UserDB.fromJson(dynamic json) {
    _uid = json['uid'];
    _name = json['name'];
    _userName = json['userName'];
    _address = json['address'];
    _phoneNumber = json['phoneNumber'].toString();
    _password = json['password'];
    _role = json['role'];
    _location = json['location'];
    if (json['orderEntities'] != null) {
      _orderEntities = [];
      json['orderEntities'].forEach((v) {
        _orderEntities?.add(v);
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  String? _uid;
  String? _name;
  dynamic _userName;
  dynamic _address;
  String? _phoneNumber;
  String? _password;
  String? _role;
  dynamic _location;
  List<dynamic>? _orderEntities;
  String? _createdAt;
  String? _updatedAt;

  UserDB copyWith({
    String? uid,
    String? name,
    dynamic userName,
    dynamic address,
    String? phoneNumber,
    String? password,
    String? role,
    dynamic location,
    List<dynamic>? orderEntities,
    String? createdAt,
    String? updatedAt,
  }) =>
      UserDB(
        uid: uid ?? _uid,
        name: name ?? _name,
        userName: userName ?? _userName,
        address: address ?? _address,
        phoneNumber: phoneNumber ?? _phoneNumber,
        password: password ?? _password,
        role: role ?? _role,
        location: location ?? _location,
        orderEntities: orderEntities ?? _orderEntities,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  String? get uid => _uid;

  String? get name => _name;

  dynamic get userName => _userName;

  dynamic get address => _address;

  String? get phoneNumber => _phoneNumber;

  String? get password => _password;

  String? get role => _role;

  dynamic get location => _location;

  List<dynamic>? get orderEntities => _orderEntities;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;


  set uid(String? value) {
    _uid = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['name'] = _name;
    map['userName'] = _userName;
    map['address'] = _address;
    map['phoneNumber'] = _phoneNumber;
    map['password'] = _password;
    map['role'] = _role;
    map['location'] = _location;
    if (_orderEntities != null) {
      map['orderEntities'] = _orderEntities?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

  set name(String? value) {
    _name = value;
  }

  set userName(dynamic value) {
    _userName = value;
  }

  set address(dynamic value) {
    _address = value;
  }

  set phoneNumber(String? value) {
    _phoneNumber = value;
  }

  set password(String? value) {
    _password = value;
  }

  set role(String? value) {
    _role = value;
  }

  set location(dynamic value) {
    _location = value;
  }

  set orderEntities(List<dynamic>? value) {
    _orderEntities = value;
  }

  set createdAt(String? value) {
    _createdAt = value;
  }

  set updatedAt(String? value) {
    _updatedAt = value;
  }
}
