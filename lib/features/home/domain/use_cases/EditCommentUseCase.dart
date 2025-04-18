import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/CommentRepo.dart';

class EditCommentUseCase {
  final CommentRepository repository;

  EditCommentUseCase(this.repository);

  Future<Either<Failure, void>> call(
      String commentId, String newText, String token) async {
    return await repository.editComment(commentId, newText, token);
  }
}
