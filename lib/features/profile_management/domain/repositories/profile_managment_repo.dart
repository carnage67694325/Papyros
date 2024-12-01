import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';

import '../entities/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfileEntity>> getUserProfile();
  Future<Either<Failure, void>> updateUserProfile(
    UserProfileEntity profile,
  );
  Future<Either<Failure, void>> deleteUserProfile(
      {required String password, required String token});
}
