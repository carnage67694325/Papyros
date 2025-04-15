import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefasHandelr {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<void> printAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      log('Stored Token: $token');
    } else {
      log('No token found in SharedPreferences.');
    }
  }

  static Future<void> checkAuthToken(context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      GoRouter.of(context).go(AppRouter.kNavigation);
    } else {
      // Token is null, navigate to login screen (optional)
      GoRouter.of(context).go(AppRouter.kGettingStarted);
    }
  }

  static Future<void> clearAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs
        .remove('auth_token'); // Removes the token from SharedPreferences
    log('Auth token cleared successfully.');
  }

  static Future<void> printUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');

    if (userId != null) {
      log('Stored userId: $userId');
    } else {
      log('No userId found in SharedPreferences.');
    }
  }

  static Future<void> storeUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
  }

  static Future<String?> geUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  static Future<void> storeUserProfileImagePath(String imagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('stored_user_profile_image_path', imagePath);
  }

  static Future<String?> retrieveStoredUserProfileImagePath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('stored_user_profile_image_path');
  }

  static Future<void> storeBackGroundProfileImagePath(String imagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('stored_background_profile_image_path', imagePath);
  }

  static Future<String?> retrieveStoredBackGroundProfileImagePath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('stored_background_profile_image_path');
  }

  static Future<ImageProvider?> getStoredImageProvider() async {
    final String? imagePath = await retrieveStoredUserProfileImagePath();
    if (imagePath != null && imagePath.isNotEmpty) {
      return FileImage(File(imagePath));
    }
    return null; // No image stored
  }
}
