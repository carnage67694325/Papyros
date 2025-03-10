import 'package:dartz/dartz.dart';
import 'package:papyros/features/posts/domain/entities/Posts%20entitr.dart';
import 'package:papyros/features/posts/domain/repositories/postRepo.dart';

import '../../../../core/errors/failure.dart';
import '../../../profile_management/domain/entities/user_profile_entity.dart';

class GetPostsUsecase{
  final PostsRepe postrepo;


  GetPostsUsecase(this.postrepo);
  Future<Either<Failure, Postsentity>> call() async {
    return await postrepo.GetPosts();
  }
}