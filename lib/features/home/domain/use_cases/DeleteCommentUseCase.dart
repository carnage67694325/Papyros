import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/CommentRepo.dart';

class DeleteCommentUseCase {
  final CommentRepository repository;

  DeleteCommentUseCase(this.repository);

  Future<Either<Failure, void>> call(String commentId, String token) async {
    return await repository.deleteComment(commentId, token);
  }
}
