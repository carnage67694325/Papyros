import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/data/data_sources/search_mention_data_source.dart';
import 'package:papyros/features/home/data/models/mention_model/datum.dart';
import 'package:papyros/features/home/data/models/mention_model/mention_model.dart';
import 'package:papyros/features/home/domain/repositories/search_mention_repo.dart';

class SearchMentionRepoImpl implements SearchMentionRepo {
  final SearchMentionDataSource searchDataSource;

  SearchMentionRepoImpl({required this.searchDataSource});
  @override
  Future<Either<Failure, List<Datum>>> searchMention(
      {required String query, required String token}) async {
    try {
      final MentionModel result =
          await searchDataSource.searchMention(query: query, token: token);
      final users = result.data ?? [];

      final List<Datum> userEntities = users.map((e) => e).toList();

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
