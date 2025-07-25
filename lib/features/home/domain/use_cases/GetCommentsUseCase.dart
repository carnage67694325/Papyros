import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/comment_entity.dart';
import '../repositories/CommentRepo.dart';

class GetCommentsUseCase {
  final CommentRepository repository;

  GetCommentsUseCase(this.repository);

  Future<Either<Failure, List<CommentEntity>>> call(
      String postId, String token) async {
    return await repository.getComments(postId, token);
  }
}
