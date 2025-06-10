import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/groups/data/models/groups/groups.dart';
import 'package:papyros/features/groups/domain/repo/group_repo.dart';

class GetGroupsUsecase {
  final GroupRepo groupRepo;

  GetGroupsUsecase({required this.groupRepo});
  Future<Either<Failure, List<Groups>>> call({required String token}) async {
    return groupRepo.getGroups(token: token);
  }
}
