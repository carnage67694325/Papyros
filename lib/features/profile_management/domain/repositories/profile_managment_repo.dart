import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';

import '../entities/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfileEntity>> getUserProfile();
  Future<Either<Failure, void>> updateUserProfile(UserProfileEntity profile,
      {required String token});
  Future<Either<Failure, void>> deleteUserProfile(
      {required String password, required String token});
}
