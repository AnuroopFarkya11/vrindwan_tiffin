import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_response.dart';
import 'package:vrindavantiffin/src/data/item_data.dart';
import 'package:vrindavantiffin/src/screen/user/home/repository/home_repository.dart';

class HomeService extends HomeRepository {
  final _logger = Logger("HomeService");

  Future<List<FoodItem>> fetchItems() async {
    String endPoint = "/food";

      final ApiResponse res = await dioClient.get(endPoint);
      if (res.isSuccess) {
        List<dynamic> entities = res.data;
        return entities.map((e) => FoodItem.fromJson(e)).toList();
      }
      throw Exception(res.errorMessage);

  }
}
