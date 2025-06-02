import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/profile_viewer/data/data_source/follow_datascoure.dart';
import 'package:papyros/features/profile_viewer/domain/repo/follow_repo.dart';

class FollowRepoImpl implements FollowRepo {
  final FollowDatascoure followDatascoure;
  FollowRepoImpl({required this.followDatascoure});
  @override
  Future<Either<Failure, void>> follow({required String userId}) async {
    try {
      String? token = await PrefasHandelr.getAuthToken();
      await followDatascoure.follow(token: token!, userId: userId);
      return right(Void);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
