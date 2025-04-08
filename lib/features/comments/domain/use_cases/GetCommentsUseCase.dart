import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/CommentEntity.dart';
import '../repositories/CommentRepo.dart';

class GetCommentsUseCase {
  final CommentRepository repository;

  GetCommentsUseCase(this.repository);

  Future<Either<Failure, List<CommentEntity>>> call(String postId) async {
    return await repository.getComments(postId);
  }
}
