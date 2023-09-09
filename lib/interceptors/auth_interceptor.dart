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
        throw Error.safeToString(err.response?.statusMessage);
      } else if (statusCode == 403) {
        throw Error.safeToString(err.response?.statusMessage);
      } else if (statusCode == 500) {
        throw Error.safeToString(err.response?.statusMessage);
      }
    } else {}

    super.onError(err, handler);
  }
}
