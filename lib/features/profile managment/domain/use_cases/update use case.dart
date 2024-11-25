import '../entities/user profile entity.dart';
import '../repositories/profile managment repo.dart';

class UpdateUserProfileUseCase {
  final ProfileRepository profileRepository;

  UpdateUserProfileUseCase(this.profileRepository);

  Future<void> call(UserProfile profile, String token) async {
    try {
      await profileRepository.updateUserProfile(profile, token: token);
    } catch (e) {
      rethrow; // Pass the error to the calling function
    }
  }
}
