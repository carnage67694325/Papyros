import '../../../../core/Prefernces/Shaerdperefeancses.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user profile entity.dart';
import '../../domain/repositories/profile managment repo.dart';
import '../data_sources/profile managment dau.dart';
import '../models/Userprofile model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final PrefasHandelr tokenHandler;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenHandler,
  });

  @override
  Future<UserProfileModel> getUserProfile() async {
    try {
      final token = await tokenHandler.getAuthToken();
      if (token == null) throw const Failure("Token not found. Please log in.");

      final data = await remoteDataSource.fetchUserProfile(token);
      return UserProfileModel.fromJson(data['user']);
    } catch (e) {
      rethrow; // Already handled errors propagate upwards
    }
  }

  @override
  Future<void> updateUserProfile(UserProfile profile, {required String token}) async {
    try {
      final profileModel = UserProfileModel(
        userName: profile.userName,
        firstName: profile.firstName,
        lastName: profile.lastName,
        email: profile.email,
        phone: profile.phone,
        bio: profile.bio,
        profileImage: profile.profileImage,
        backgroundImage: profile.backgroundImage,
        location: profile.location,
      );

      await remoteDataSource.updateUserProfile(profileModel, token);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUserProfile({required String password, required String token}) async {
    try {
      await remoteDataSource.deleteUserProfile(password, token);
    } catch (e) {
      rethrow;
    }
  }
}
