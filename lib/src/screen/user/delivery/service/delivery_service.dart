import 'dart:convert';

import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_response.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/repository/delivery_repository.dart';

class AddressService extends DeliveryAddressRepository {
  @override
  Future<Address> addAddress({required Address address}) async {
    String endPoint = "/user/addAddress";
    final ApiResponse response =
        await dioClient.post(endPoint, data: address.toJson());

    if (response.isSuccess) {
      return Address.fromJson(response.data);
    }
    throw new Exception(response.errorMessage);
  }
}
