import 'package:dio/dio.dart';
import 'package:xyz_cart/services/local_prefs.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   options.headers['Authorization'] = 'Bearer $accessToken';
  //   super.onRequest(options, handler);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      final statusCode = err.response?.statusCode;
      final LocalPreferences localPreferences = LocalPreferences.instance;
      if (statusCode == 401) {
        final request = err.requestOptions;
        final newAccessToken = await localPreferences.getrefreshToken();
        if (newAccessToken != null) {
          try {
            final dio = Dio();
            final response = await dio.request<dynamic>(
              request.path,
              data: request.data,
              queryParameters: request.queryParameters,
              options: Options(
                method: request.method,
                headers: request.headers,
              ),
            );

            handler.resolve(response);
            return;
          } on DioException catch (retryError) {
            handler.reject(retryError);
            return;
          }
        } else {
          throw Error.safeToString(err.response!.statusMessage);
        }
      } else if (statusCode == 403) {
        throw Error.safeToString(err.response?.statusMessage);
      } else if (statusCode == 500) {
        throw Error.safeToString(err.response?.statusMessage);
      }
    } else {}

    super.onError(err, handler);
  }
}
