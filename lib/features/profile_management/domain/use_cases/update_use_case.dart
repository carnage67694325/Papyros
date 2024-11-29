import '../entities/user_profile_entity.dart';
import '../repositories/profile_managment_repo.dart';

class UpdateUserProfileUseCase {
  final ProfileRepository profileRepository;

  UpdateUserProfileUseCase(this.profileRepository);

  Future<void> call(UserProfileEntity profile, String token) async {
    await profileRepository.updateUserProfile(profile, token: token);
  }
}
