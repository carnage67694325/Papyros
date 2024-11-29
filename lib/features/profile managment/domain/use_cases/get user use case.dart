import '../entities/user profile entity.dart';
import '../repositories/profile managment repo.dart';

class GetUserProfileUseCase {
  final ProfileRepository profileRepository;

  GetUserProfileUseCase(this.profileRepository);

  Future<UserProfile> call() async {
    try {
      return await profileRepository.getUserProfile();
    } catch (e) {
      rethrow; // Pass the error to the calling function
    }
  }
}
