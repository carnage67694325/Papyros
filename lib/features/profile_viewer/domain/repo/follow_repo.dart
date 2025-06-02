import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';

abstract class FollowRepo {
  Future<Either<Failure, void>> follow({required String userId});
}
