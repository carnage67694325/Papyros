import 'package:dartz/dartz.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<MessageEntity>>> getMessages(String toUserId);
  Future<Either<Failure, void>> sendMessage(
      String toUserId, String message, String token);
  Future<Either<Failure, void>> initSocket(String token, String userId);
}
