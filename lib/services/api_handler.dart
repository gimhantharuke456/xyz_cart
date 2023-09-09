import 'package:dio/dio.dart';

class ApiHandler {
  ApiHandler._();

  static final ApiHandler _instance = ApiHandler._();

  factory ApiHandler() {
    return _instance;
  }
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://api.example.com',
          connectTimeout: const Duration(seconds: 5000),
          receiveTimeout: const Duration(seconds: 5000),
          headers: {
            'Accept': 'application/json',
          },
        ),
      );
}