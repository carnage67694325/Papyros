import 'package:dartz/dartz.dart';
import 'package:papyros/features/posts/domain/entities/Posts%20entitr.dart';

import '../../../../core/errors/failure.dart';

abstract class PostsRepe{
  Future<Either<Failure,Postsentity >> GetPosts();
}