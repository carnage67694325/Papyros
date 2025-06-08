import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/domain/entities/posts_entity.dart';
import 'package:papyros/features/home/domain/repositories/post_repo.dart';

class GetRecommandPostsUsecase {
  late final GetPostsRepo postrepo;
  Future<Either<Failure, List<PostsEntity>>> call(
      {required String token}) async {
    return await postrepo.getRecommendPosts(token: token);
  }
}
