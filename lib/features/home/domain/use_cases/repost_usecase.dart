import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/domain/repositories/repost_repo.dart';

class RepostUsecase {
  final RepostRepo repostRepo;

  RepostUsecase({required this.repostRepo});
  Future<Either<Failure, void>> call({
    required String token,
    required String postId,
  }) async {
    return repostRepo.repost(token: token, postId: postId);
  }
}
