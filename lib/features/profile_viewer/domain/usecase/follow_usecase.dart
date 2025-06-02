import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/profile_viewer/domain/repo/follow_repo.dart';

class FollowUsecase {
  final FollowRepo followRepo;
  FollowUsecase(this.followRepo);
  Future<Either<Failure, void>> call({required String userId}) async {
    return await followRepo.follow(userId: userId);
  }
}
