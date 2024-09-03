import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/service/api_service/interceptors/log_interceptor.dart';

final dioClientProvider = Provider((ref) {
  final Dio dio = Dio();
  return DioClient(dio: dio);
});

class DioClient {
  final Dio _dio;
  final _logger = Logger("DioClient");

  DioClient({required Dio dio}) : _dio = dio {
    // _dio.options.baseUrl = 'localhost:8080';
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers = {'Content-Type': 'application/json'};

    _dio.interceptors.addAll([
      LoggingInterceptor(),
    ]);
  }

  Future<Response> get(String endPoint,
      {Map<String, dynamic>? queryParameter}) async {
    try {
      final response =
          await _dio.get(endPoint, queryParameters: queryParameter);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> post(String endPoint, {dynamic data}) async {
    try {
      final response = _dio.post(endPoint, data: data);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> patch(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.patch(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        _logger.log("Connection Timeout Exception");
        break;
      case DioExceptionType.sendTimeout:
        _logger.log("Send Timeout Exception");
        break;
      case DioExceptionType.receiveTimeout:
        _logger.log("Receive Timeout Exception");
        break;
      case DioExceptionType.badResponse:
        // The server responded with a non-2XX status code
        _logger
            .log("Received invalid status code: ${error.response?.statusCode}");
        break;
      case DioExceptionType.cancel:
        _logger.log("Request was cancelled");
        break;

      default:
        _logger.log("Unexpected error: ${error.message}");
        break;
    }
  }
}
