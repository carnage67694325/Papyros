import 'package:dartz/dartz.dart';
import 'package:papyros/features/home/domain/entities/posts_entity.dart';
import 'package:papyros/features/home/domain/repositories/post_repo.dart';

import '../../../../core/errors/failure.dart';

class GetPostsUsecase {
  final GetPostsRepo postrepo;

  GetPostsUsecase(this.postrepo);
  Future<Either<Failure, List<PostsEntity>>> call() async {
    return await postrepo.getPosts();
  }
}
