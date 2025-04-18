import 'package:papyros/features/home/data/models/comments.dart';

abstract class CommentRemoteDataSource {
  Future<List<CommentModel>> getComments(String postId, String token);
  Future<void> addComment(CommentModel comment, String token, String postId);
  Future<void> editComment(String commentId, String newText, String token);
  Future<void> deleteComment(String commentId, String token);
  Future<void> likeComment(String commentId, String token);
  Future<void> replyToComment(
      String commentId, CommentModel reply, String token);
}
