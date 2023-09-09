import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  final String _token = "token";
  final String _refreshToken = "refreshToken";

  static LocalPreferences? _instance;
  SharedPreferences? _sharedPreferences;

  LocalPreferences._();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static LocalPreferences get instance {
    _instance ??= LocalPreferences._();
    return _instance!;
  }

  void setToken(String token) {
    _sharedPreferences!.setString(_token, token);
  }

  void setRefreshToken(String token) {
    _sharedPreferences!.setString(_refreshToken, token);
  }

  Future<String?> getToken() async {
    return _sharedPreferences!.getString(_token);
  }

  Future<String?> getrefreshToken() async {
    return _sharedPreferences!.getString(_refreshToken);
  }

  void clearePrefs() {
    _sharedPreferences?.clear();
  }
}
