import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/data/data_sources/repost_data_source.dart';
import 'package:papyros/features/home/domain/repositories/repost_repo.dart';

class RepostRepoImpl implements RepostRepo {
  final RepostDataSource repostDataSource;

  RepostRepoImpl({required this.repostDataSource});
  @override
  Future<Either<Failure, void>> repost(
      {required String token, required String postId}) async {
    try {
      await repostDataSource.repost(token: token, postId: postId);

      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
