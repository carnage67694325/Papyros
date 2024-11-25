import '../repositories/profile managment repo.dart';

class DeleteUserProfileUseCase {
  final ProfileRepository profileRepository;

  DeleteUserProfileUseCase(this.profileRepository);

  Future<void> call(String password, String token) async {
    try {
      await profileRepository.deleteUserProfile(password: password, token: token);
    } catch (e) {
      rethrow; // Pass the error to the calling function
    }
  }
}
