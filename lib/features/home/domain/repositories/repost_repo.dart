import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';

abstract class RepostRepo {
  Future<Either<Failure, void>> repost(
      {required String token, required String postId});
}
