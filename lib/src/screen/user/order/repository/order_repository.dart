import 'package:dio/dio.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_service.dart';

abstract class OrderRepository{
  final DioClient dioClient = new DioClient(dio: Dio());
  Future<void> placeOrder();
}