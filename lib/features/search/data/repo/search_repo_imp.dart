import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/search/data/data_source/search_data_source.dart';
import 'package:papyros/features/search/data/models/search_model/search_model.dart';
import 'package:papyros/features/search/data/models/search_model/user.dart';
import 'package:papyros/features/search/domain/entity/user_entity.dart';
import 'package:papyros/features/search/domain/repo/search_repo.dart';

class SearchRepoImp implements SearchRepo {
  final SearchDataSource searchDataSource;

  SearchRepoImp({required this.searchDataSource});

  @override
  Future<Either<Failure, List<UserEntity>>> search(String query) async {
    try {
      final SearchModel result = await searchDataSource.search(query);
      final users = result.user ?? [];

      final List<UserEntity> userEntities =
          users.map((e) => e.toEntity()).toList();

      return right(userEntities);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
