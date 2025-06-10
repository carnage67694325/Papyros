import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/groups/data/models/groups/groups.dart';

abstract class GroupRepo {
  Future<Either<Failure, List<Groups>>> getGroups({required String token});
}
