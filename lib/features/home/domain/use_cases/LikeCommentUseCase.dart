import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/CommentRepo.dart';

class LikeCommentUseCase {
  final CommentRepository repository;

  LikeCommentUseCase(this.repository);

  Future<Either<Failure, void>> call(String commentId, String token) async {
    return await repository.likeComment(commentId, token);
  }
}
