import 'package:shared_preferences/shared_preferences.dart';

class PrefasHandelr {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setToken(String token) {
    return prefs.setString('token', token);
  }

  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<bool> clearToken() {
    return prefs.remove("token");
  }
}
