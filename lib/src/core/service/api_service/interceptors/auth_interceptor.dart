import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String _authToken;

  AuthInterceptor(this._authToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $_authToken';
    super.onRequest(options, handler);
  }


}
