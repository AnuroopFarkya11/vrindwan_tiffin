import 'package:dio/dio.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_service.dart';

class ConsoleRepository{
  final DioClient dioClient = DioClient(dio: Dio());
}