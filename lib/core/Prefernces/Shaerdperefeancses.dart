import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefasHandelr {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> printAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      log('Stored Token: $token');
    } else {
      log('No token found in SharedPreferences.');
    }
  }

  Future<void> checkAuthToken(context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      GoRouter.of(context).go(AppRouter.kSignIn);
    } else {
      // Token is null, navigate to login screen (optional)
      GoRouter.of(context).go(AppRouter.kGettingStarted);
    }
  }

  Future<void> clearAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs
        .remove('auth_token'); // Removes the token from SharedPreferences
    log('Auth token cleared successfully.');
  }
}
