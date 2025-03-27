import 'package:dartz/dartz.dart';
import 'package:papyros/features/home/domain/entities/posts_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class GetPostsRepo {
  Future<Either<Failure, List<PostsEntity>>> getPosts();
}
