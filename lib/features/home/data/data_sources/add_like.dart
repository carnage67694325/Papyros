import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';

abstract class AddLike {
  Future<void> addLike({required String token, required String postId});
}
