import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/groups/data/models/groups/group.dart';
import 'package:papyros/features/groups/data/models/groups/groups.dart';

abstract class GroupRepo {
  Future<Either<Failure, Groups>> getGroups({required String token});
  Future<Either<Failure, void>> addPost(
      {required String token, required Group group});
}
