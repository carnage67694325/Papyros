import 'package:dartz/dartz.dart';
import 'package:papyros/features/home/data/models/comments.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/CommentRepo.dart';

class AddCommentUseCase {
  final CommentRepository repository;

  AddCommentUseCase(this.repository);

  Future<Either<Failure, void>> call(
      CommentModel comment, String token, String postId) async {
    return await repository.addComment(comment, token, postId);
  }
}
