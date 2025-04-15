import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/data/data_sources/add_like_data_source.dart';
import 'package:papyros/features/home/data/data_sources/add_post.dart';
import 'package:papyros/features/home/data/data_sources/get_posts.dart';
import 'package:papyros/features/home/data/models/Posts.dart';
import 'package:papyros/features/home/domain/entities/posts_entity.dart';
import 'package:papyros/features/home/domain/repositories/post_repo.dart';

class GetPostsRepoimp implements GetPostsRepo {
  final Getpostsdatasource postdau;
  final AddPost? addPostDataSource;
  final AddLikeDataSource? addLikeDataSource;

  GetPostsRepoimp(
    this.postdau,
    this.addPostDataSource,
    this.addLikeDataSource,
  );
  @override
  Future<Either<Failure, List<PostsEntity>>> getPosts() async {
    try {
      final data = await postdau.getallposts();
      final List<PostsEntity> postsList = (data["posts"] as List)
          .map((post) => PostModel.fromJson(post))
          .toList();

      return right(postsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> addPost(
      {required String token, required PostModel post}) async {
    try {
      if (addPostDataSource != null) {
        await addPostDataSource!.addPost(token: token, post: post);
      }
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> addLike(
      {required String token, required String postId}) async {
    try {
      await addLikeDataSource!.addLike(token: token, postId: postId);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
