import 'package:dartz/dartz.dart';
import 'package:papyros/features/home/data/models/comments.dart';

import '../../../../core/errors/failure.dart';
import '../entities/comment_entity.dart';
import '../repositories/CommentRepo.dart';

class ReplyToCommentUseCase {
  final CommentRepository repository;

  ReplyToCommentUseCase(this.repository);

  Future<Either<Failure, void>> call(
      String commentId, CommentModel reply, String token) async {
    return await repository.replyToComment(commentId, reply, token);
  }
}
