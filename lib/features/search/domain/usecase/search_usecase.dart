import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/search/domain/entity/user_entity.dart';
import 'package:papyros/features/search/domain/repo/search_repo.dart';

class SearchUsecase {
  final SearchRepo searchRepo;

  SearchUsecase({required this.searchRepo});
  Future<Either<Failure, List<UserEntity>>> call(String query) async {
    return await searchRepo.search(query);
  }
}
