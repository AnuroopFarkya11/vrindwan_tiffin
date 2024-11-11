import 'package:vrindavantiffin/src/core/models/order_model.dart';

enum OrderStatus { initial, loaded, loading, failed }

class OrderState {
  final OrderStatus status;
  final Order? order;
  final List<Order>? orders;
  final String? message;

  OrderState({required this.status, this.orders, this.order, this.message}) {}

  OrderState copyWith(
      {OrderStatus? status,
      List<Order>? orders,
      Order? order,
      String? message}) {
    return OrderState(
        status: status ?? this.status,
        orders: orders ?? this.orders,
        order: order ?? this.order,
        message: message ?? this.message);
  }
}
