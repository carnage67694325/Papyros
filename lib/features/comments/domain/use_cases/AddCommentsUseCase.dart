import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/CommentEntity.dart';
import '../repositories/CommentRepo.dart';

class AddCommentUseCase {
  final CommentRepository repository;

  AddCommentUseCase(this.repository);

  Future<Either<Failure, void>> call(CommentEntity comment) async {
    return await repository.addComment(comment);
  }
}
