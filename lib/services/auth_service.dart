import 'package:dio/dio.dart';
import 'package:xyz_cart/services/api_handler.dart';

class AuthService {
  final ApiHandler _apiHandler = ApiHandler();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _apiHandler.dio.post(
        '/api/v2/auth/login',
        data: {
          'email': email,
          'password': password,
          'remember_me': 1,
          'system_user': 1,
        },
        options: Options(headers: {'Tz': 'Europe/London'}),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Authentication failed');
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}
