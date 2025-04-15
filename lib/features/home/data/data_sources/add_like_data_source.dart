import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';

abstract class AddLikeDataSource {
  Future<void> addLike({required String token, required String postId});
}
