import 'package:shared_preferences/shared_preferences.dart';

class prefasHandelr {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setToken(String token) {
    return prefs.setString('token', token);
  }

  static String getToken() {
    return prefs.getString('token') ?? "";
  }

  static Future<bool> clearToken() {
    return prefs.remove("token");
  }
}
