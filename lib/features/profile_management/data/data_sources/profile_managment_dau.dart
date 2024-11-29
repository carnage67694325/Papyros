import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';

import '../models/Userprofile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<Map<String, dynamic>> fetchUserProfile(String token);
  Future<void> updateUserProfile(
    UserProfileModel profileModel,
    String token,
  );
  Future<void> deleteUserProfile(String password, String token);
}
