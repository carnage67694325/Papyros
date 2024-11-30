import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';

import '../repositories/profile_managment_repo.dart';

class DeleteUserProfileUseCase {
  final ProfileRepository profileRepository;

  DeleteUserProfileUseCase(this.profileRepository);

  Future<Either<Failure, void>> call(String password, String token) async {
    return await profileRepository.deleteUserProfile(
        password: password, token: token);
  }
}
