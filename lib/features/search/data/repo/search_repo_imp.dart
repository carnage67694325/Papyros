import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/profile_management/data/models/User_profile_model.dart';
import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';
import 'package:papyros/features/search/data/data_source/search_data_source.dart';
import 'package:papyros/features/search/domain/repo/search_repo.dart';

class SearchRepoImp implements SearchRepo {
  final SearchDataSource searchDataSource;

  SearchRepoImp({required this.searchDataSource});
  @override
  Future<Either<Failure, UserProfileEntity>> search(String query) async {
    try {
      final data = await searchDataSource.search(query);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
