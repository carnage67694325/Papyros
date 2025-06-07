import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/data/models/mention_model/datum.dart';
import 'package:papyros/features/home/domain/repositories/search_mention_repo.dart';

class SearchMentionUsecase {
  final SearchMentionRepo searchRepo;

  SearchMentionUsecase({required this.searchRepo});
  Future<Either<Failure, List<Datum>>> call(
      {required String query, required String token}) async {
    return await searchRepo.searchMention(
      query: query,
      token: token,
    );
  }
}
