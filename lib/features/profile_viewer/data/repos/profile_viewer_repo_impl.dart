import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/profile_viewer/data/data_source/profile_viewer_data_source.dart';
import 'package:papyros/features/profile_viewer/data/model/user_viewer/user_viewer.dart';
import 'package:papyros/features/profile_viewer/domain/repo/profile_viewer_repo.dart';

class ProfileViewerRepoImpl implements ProfileViewerRepo {
  final ProfileViewerDataSource remoteDataSource;

  ProfileViewerRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, UserViewer>> getUserProfile(String userId) async {
    try {
      final data = await remoteDataSource.getUserProfile(userId);
      return right(UserViewer.fromJson(data.toJson()));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
