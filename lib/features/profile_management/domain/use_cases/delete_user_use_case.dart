import '../repositories/profile_managment_repo.dart';

class DeleteUserProfileUseCase {
  final ProfileRepository profileRepository;

  DeleteUserProfileUseCase(this.profileRepository);

  Future<void> call(String password, String token) async {
    await profileRepository.deleteUserProfile(password: password, token: token);
  }
}
