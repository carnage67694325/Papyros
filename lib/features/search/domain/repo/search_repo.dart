import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, UserProfileEntity>> search(String query);
}
