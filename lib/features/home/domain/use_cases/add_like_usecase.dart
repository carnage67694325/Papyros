import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/data/repositories/posts_entity_imp.dart';

class AddLikeUscase {
  final GetPostsRepoimp getPostsRepoimp;

  AddLikeUscase({required this.getPostsRepoimp});

  // ignore: non_constant_identifier_names
  Future<Either<Failure, void>> call(String token, String postId) {
    return getPostsRepoimp.addLike(token: token, postId: postId);
  }
}
