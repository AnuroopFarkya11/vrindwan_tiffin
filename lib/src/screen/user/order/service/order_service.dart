import 'package:vrindavantiffin/src/core/models/order_model.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_response.dart';
import 'package:vrindavantiffin/src/screen/user/order/repository/order_repository.dart';

class OrderService extends OrderRepository {
  @override
  Future<Order> placeOrder({required Order order}) async {
    String endPoint = "/order";
    ApiResponse response = await dioClient.post(endPoint, data: order.toJson());
    if (response.isSuccess) {
      return Order.fromJson(response.data);
    }
    throw Exception(response.errorMessage);
  }

  @override
  Future<List<Order>> getOrderList() async {
    String endPoint = "/order";
    ApiResponse response = await dioClient.get(endPoint);

    if (response.isSuccess) {
      List<dynamic> list = response.data;
      List<Order> orders = list.map((e) => Order.fromJson(e)).toList();
      return orders;
    }

    throw Exception(response.errorMessage);
  }

  @override
  Future<Order> getOrderById({required String id}) async{

    if(id.isNotEmpty)
      {
        String endPoint = "/order/$id";
        ApiResponse response = await dioClient.get(endPoint);
        if(response.isSuccess)
          {
            try{
              Order order = Order.fromJson(response.data);
              return order;
            }
            catch(e){
              throw Exception(e);
            }
          }
        throw Exception(response.errorMessage);

      }

    throw Exception("Id is empty");
  }




}
