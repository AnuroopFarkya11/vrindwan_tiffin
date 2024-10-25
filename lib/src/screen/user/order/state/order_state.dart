enum OrderStatus { initial, loaded, loading, failed }

class OrderState {
  final OrderStatus status;
  final String? message;

  OrderState({required this.status, this.message}) {}

  OrderState copyWith({OrderStatus? status, String? message}) {
    return OrderState(
        status: status ?? this.status, message: message ?? this.message);
  }
}
