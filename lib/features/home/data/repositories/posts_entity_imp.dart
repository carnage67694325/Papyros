import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/data/data_sources/get_posts.dart';
import 'package:papyros/features/home/data/models/Allpostsmodel.dart';
import 'package:papyros/features/home/data/models/Posts.dart';
import 'package:papyros/features/home/domain/entities/posts_entity.dart';
import 'package:papyros/features/home/domain/repositories/post_repo.dart';

import '../../../../core/Prefernces/Shaerdperefeancses.dart';

class Postsrepoimp implements GetPostsRepo {
  final Getpostsdatasource postdau;
  final PrefasHandelr tokenHandler;
  Postsrepoimp(this.postdau, this.tokenHandler);
  @override
  Future<Either<Failure, PostsEntity>> getPosts() async {
    try {
      final token = await tokenHandler.getAuthToken();

      final data = await postdau.getallposts(token!);
      return right(Allpostsmodel.fromJson(data["Posts"]) as PostsEntity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
