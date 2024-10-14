import 'package:dio/dio.dart';
import 'package:vrindavantiffin/src/core/models/item_model.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_service.dart';
import 'package:vrindavantiffin/src/data/item_data.dart';
class HomeRepository {
  final DioClient dioClient = DioClient(dio: Dio());
}
