import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';

import '../entities/user_profile_entity.dart';
import '../repositories/profile_managment_repo.dart';

class GetUserProfileUseCase {
  final ProfileRepository profileRepository;

  GetUserProfileUseCase(this.profileRepository);

  Future<Either<Failure, UserProfileEntity>> call() async {
    return await profileRepository.getUserProfile();
  }
}
