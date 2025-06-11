import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/groups/data/models/groups/group.dart';
import 'package:papyros/features/groups/domain/repo/group_repo.dart';

class AddGroupUsecase {
  final GroupRepo groupRepo;

  AddGroupUsecase({required this.groupRepo});
  Future<Either<Failure, void>> call(
      {required String token, required Group group}) async {
    return groupRepo.addGroup(token: token, group: group);
  }
}
