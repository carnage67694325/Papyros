import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';

import '../entities/user_profile_entity.dart';
import '../repositories/profile_managment_repo.dart';

class UpdateUserProfileUseCase {
  final ProfileRepository profileRepository;

  UpdateUserProfileUseCase(this.profileRepository);

  Future<Either<Failure, void>> call(
      UserProfileEntity profile, String token) async {
    return await profileRepository.updateUserProfile(profile, token: token);
  }
}
