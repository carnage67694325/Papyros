import 'package:dartz/dartz.dart';
import 'package:papyros/features/home/data/data_sources/comments_dau.dart';
import 'package:papyros/features/home/data/models/comments.dart';
import 'package:papyros/features/home/domain/entities/comment_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/CommentRepo.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource remoteDataSource;

  CommentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments(
      String postId, String token) async {
    try {
      final comments = await remoteDataSource.getComments(postId, token);
      return Right(comments.map((comment) => comment.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addComment(
    CommentModel comment,
    String token,
    String postId,
  ) async {
    try {
      await remoteDataSource.addComment(comment, token, postId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editComment(
      String commentId, String newText, String token) async {
    try {
      await remoteDataSource.editComment(commentId, newText, token);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteComment(
      String commentId, String token) async {
    try {
      await remoteDataSource.deleteComment(commentId, token);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> likeComment(
      String commentId, String token) async {
    try {
      await remoteDataSource.likeComment(commentId, token);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> replyToComment(
      String commentId, CommentModel reply, String token) async {
    try {
      await remoteDataSource.replyToComment(commentId, reply, token);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
