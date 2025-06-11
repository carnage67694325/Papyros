import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/groups/data/models/groups/group.dart';
import 'package:papyros/features/groups/data/models/groups/groups.dart';
import 'package:papyros/features/groups/data/models/single_group_model/single_group_model.dart';

abstract class GroupRepo {
  Future<Either<Failure, Groups>> getGroups({required String token});
  Future<Either<Failure, SingleGroupModel>> getSingleGroup(
      {required String token, required String groupId});

  Future<Either<Failure, void>> addGroup(
      {required String token, required Group group});
}
