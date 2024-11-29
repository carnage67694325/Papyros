import '../models/Userprofile model.dart';

abstract class ProfileRemoteDataSource {
  Future<Map<String, dynamic>> fetchUserProfile(String token);
  Future<void> updateUserProfile(
      UserProfileModel profileModel,
      String token,
      );
  Future<void> deleteUserProfile(String password, String token);
}
