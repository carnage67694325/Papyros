import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/comment_entity.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<CommentEntity>>> getComments(
    String postId,
  );
  Future<Either<Failure, void>> addComment(
    CommentEntity comment,
  );
  Future<Either<Failure, void>> editComment(String commentId, String newText);
  Future<Either<Failure, void>> deleteComment(String commentId);
  Future<Either<Failure, void>> likeComment(String commentId);
  Future<Either<Failure, void>> replyToComment(
      String commentId, CommentEntity reply);
}
