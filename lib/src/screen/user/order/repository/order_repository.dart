import 'package:dio/dio.dart';
import 'package:vrindavantiffin/src/core/models/order_model.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_service.dart';

abstract class OrderRepository{
  final DioClient dioClient = new DioClient(dio: Dio());
  Future<void> placeOrder({required Order order});
  Future<List<Order>> getOrderList();
  Future<Order> getOrderById({required String id});
}