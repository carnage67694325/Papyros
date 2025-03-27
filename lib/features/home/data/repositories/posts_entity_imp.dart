import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/data/data_sources/get_posts.dart';
import 'package:papyros/features/home/data/models/Allpostsmodel.dart';
import 'package:papyros/features/home/data/models/Posts.dart';
import 'package:papyros/features/home/domain/entities/posts_entity.dart';
import 'package:papyros/features/home/domain/repositories/post_repo.dart';

import '../../../../core/Prefernces/Shaerdperefeancses.dart';

class GetPostsRepoimp implements GetPostsRepo {
  final Getpostsdatasource postdau;
  GetPostsRepoimp(this.postdau);
  @override
  Future<Either<Failure, List<PostsEntity>>> getPosts() async {
    try {
      final data = await postdau.getallposts();
      final List<PostsEntity> postsList =
          (data["posts"] as List).map((post) => Posts.fromJson(post)).toList();

      return right(postsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
