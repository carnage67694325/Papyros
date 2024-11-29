import '../entities/user profile entity.dart';

abstract class ProfileRepository {
  Future<UserProfile> getUserProfile();
  Future<void> updateUserProfile(UserProfile profile, {required String token});
  Future<void> deleteUserProfile({required String password, required String token});
}
