import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/home/data/models/Posts.dart';
import 'package:papyros/features/home/domain/repositories/post_repo.dart';

class AddPostUseCase {
  final GetPostsRepo postRepo;

  AddPostUseCase(this.postRepo);

  Future<Either<Failure, void>> call({
    required String token,
    required PostModel post,
  }) {
    return postRepo.addPost(token: token, post: post);
  }
}
