import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/posts/data/data_sources/get%20posts.dart';
import 'package:papyros/features/posts/data/models/Allpostsmodel.dart';
import 'package:papyros/features/posts/data/models/Posts.dart';
import 'package:papyros/features/posts/domain/entities/Posts%20entitr.dart';
import 'package:papyros/features/posts/domain/repositories/postRepo.dart';

import '../../../../core/Prefernces/Shaerdperefeancses.dart';

class Postsrepoimp implements PostsRepe{
  final Getpostsdatasource postdau;
  final PrefasHandelr tokenHandler;
  Postsrepoimp(this.postdau, this.tokenHandler);
  @override
  Future<Either<Failure, Postsentity>> GetPosts() async { try {
    final token = await tokenHandler.getAuthToken();

    final data = await postdau.getallposts(token!);
    return right(Allpostsmodel.fromJson(data["Posts"]) as Postsentity);
  } catch (e) {
    if (e is DioException) {
      return left(ServerFailure.fromDioException(e));
    } else {
      return left(ServerFailure(e.toString()));
    }
  }

  }

}