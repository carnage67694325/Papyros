import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/groups/data/models/single_group_model/single_group_model.dart';
import 'package:papyros/features/groups/domain/repo/group_repo.dart';

class GetSingleGroupUsecase {
  final GroupRepo groupRepo;

  GetSingleGroupUsecase({required this.groupRepo});
  Future<Either<Failure, SingleGroupModel>> call(
      {required String token, required groupId}) async {
    return groupRepo.getSingleGroup(token: token, groupId: groupId);
  }
}
