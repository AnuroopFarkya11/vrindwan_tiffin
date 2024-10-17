import 'package:dio/dio.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_service.dart';

abstract class DeliveryAddressRepository {
  final DioClient dioClient = DioClient(dio: Dio());
  Future<void> addAddress({required Address address});
}


