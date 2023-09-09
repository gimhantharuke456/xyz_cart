import 'package:xyz_cart/interceptors/auth_interceptor.dart';
import 'package:xyz_cart/models/token_container.dart';
import 'package:xyz_cart/services/api_handler.dart';

class AuthService {
  final ApiHandler _apiHandler = ApiHandler();

  Future<TokenContainer> login(String email, String password) async {
    try {
      _apiHandler.dio.interceptors.add(AuthInterceptor());
      final response = await _apiHandler.dio.post(
        '/api/v2/auth/login',
        data: {
          'email': email,
          'password': password,
          'remember_me': 1,
          'system_user': 1,
        },
      );

      if (response.statusCode == 200) {
        return TokenContainer.fromJson(response.data);
      } else {
        throw Exception('Authentication failed');
      }
    } catch (e) {
      throw Exception('Network error $e');
    }
  }
}
