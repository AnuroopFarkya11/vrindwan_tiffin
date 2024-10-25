import 'package:vrindavantiffin/src/core/models/order_model.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_response.dart';
import 'package:vrindavantiffin/src/screen/user/order/repository/order_repository.dart';

class OrderService extends OrderRepository {
  @override
  Future<Order> placeOrder({required Order order}) async {
    String endPoint = "/order";
    ApiResponse response =
    await dioClient.post(endPoint, data: order.toJson());
    if(response.isSuccess)
    {
      return Order.fromJson(response.data);
    }
    throw Exception(response.errorMessage);
  }
}
