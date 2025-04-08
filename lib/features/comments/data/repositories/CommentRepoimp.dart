import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/CommentEntity.dart';
import '../../domain/repositories/CommentRepo.dart';
import '../data_sources/comments dau.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource remoteDataSource;

  CommentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments(String postId) async {
    try {
      final comments = await remoteDataSource.getComments(postId);
      return Right(comments.map((comment) => comment.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addComment(CommentEntity comment, ) async {
    try {
      await remoteDataSource.addComment(comment.toModel());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editComment(String commentId, String newText) async {
    try {
      await remoteDataSource.editComment(commentId, newText);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteComment(String commentId) async {
    try {
      await remoteDataSource.deleteComment(commentId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure( e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> likeComment(String commentId) async {
    try {
      await remoteDataSource.likeComment(commentId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> replyToComment(String commentId, CommentEntity reply) async {
    try {
      await remoteDataSource.replyToComment(commentId, reply.toModel());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
