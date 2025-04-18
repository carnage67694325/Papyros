import 'package:dio/dio.dart';
import 'package:papyros/features/home/data/models/comments.dart';

import '../../../../core/endpoints/endpiont.dart';
import '../../../../core/utils/api_service.dart';
import 'comments_dau.dart';

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final Dio dio;

  CommentRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CommentModel>> getComments(String postId, String token) async {
    final response = await dio.get(
      '${ApiService.baseUrl}${Endpiont.getallcomments}/$postId',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> addComment(
      CommentModel comment, String token, String postId) async {
    await dio.post(
      '${ApiService.baseUrl}${Endpiont.addCommentEndpoint}/$postId',
      data: comment.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  @override
  Future<void> editComment(
      String commentId, String newText, String token) async {
    await dio.put(
      '${ApiService.baseUrl}${Endpiont.editcommentEndpoint}/$commentId',
      data: {'text': newText},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  @override
  Future<void> deleteComment(String commentId, String token) async {
    await dio.delete(
      '${ApiService.baseUrl}${Endpiont.deleteCommentEndpoint}/$commentId',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  @override
  Future<void> likeComment(String commentId, String token) async {
    await dio.post(
      '${ApiService.baseUrl}${Endpiont.addLikecommentEndpoint}/$commentId/like',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  @override
  Future<void> replyToComment(
      String commentId, CommentModel reply, String token) async {
    await dio.post(
      '${ApiService.baseUrl}${Endpiont.replyCommentEndpoint}/$commentId/reply',
      data: reply.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
