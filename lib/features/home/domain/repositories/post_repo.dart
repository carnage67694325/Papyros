import 'package:dartz/dartz.dart';
import 'package:papyros/features/home/data/models/Posts.dart';
import 'package:papyros/features/home/domain/entities/posts_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class GetPostsRepo {
  Future<Either<Failure, List<PostsEntity>>> getPosts();
  Future<Either<Failure, List<PostsEntity>>> getRecommendPosts(
      {required String token});

  Future<Either<Failure, void>> addPost(
      {required String token, required PostModel post});
  Future<Either<Failure, void>> addLike(
      {required String token, required String postId});
}
