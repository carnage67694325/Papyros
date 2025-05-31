import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/search/domain/entity/user_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<UserEntity>>> search(String query);
}
