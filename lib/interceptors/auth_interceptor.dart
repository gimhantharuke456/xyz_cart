import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   options.headers['Authorization'] = 'Bearer $accessToken';
  //   super.onRequest(options, handler);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      final statusCode = err.response?.statusCode;

      if (statusCode == 401) {
      } else if (statusCode == 403) {
      } else if (statusCode == 500) {}
    } else {}

    super.onError(err, handler);
  }
}
