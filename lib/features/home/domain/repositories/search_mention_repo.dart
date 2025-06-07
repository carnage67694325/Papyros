import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/data/models/mention_model/datum.dart';

abstract class SearchMentionRepo {
  Future<Either<Failure, List<Datum>>> searchMention(
      {required String query, required String token});
}
