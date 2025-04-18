import 'package:dartz/dartz.dart';
import 'package:papyros/features/home/data/models/comments.dart';

import '../../../../core/errors/failure.dart';
import '../entities/comment_entity.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<CommentEntity>>> getComments(
      String postId, String token);
  Future<Either<Failure, void>> addComment(
    CommentModel comment,
    String token,
    String postId,
  );
  Future<Either<Failure, void>> editComment(
      String commentId, String newText, String token);
  Future<Either<Failure, void>> deleteComment(String commentId, String token);
  Future<Either<Failure, void>> likeComment(String commentId, String token);
  Future<Either<Failure, void>> replyToComment(
      String commentId, CommentModel reply, String token);
}
