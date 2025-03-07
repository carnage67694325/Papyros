import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/CommentEntity.dart';
import '../repositories/CommentRepo.dart';

class ReplyToCommentUseCase {
  final CommentRepository repository;

  ReplyToCommentUseCase(this.repository);

  Future<Either<Failure, void>> call(String commentId, CommentEntity reply) async {
    return await repository.replyToComment(commentId, reply);
  }
}
