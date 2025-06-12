import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/chat_room/domain/entities/group_message_entity.dart';

abstract class GroupChatRepository {
  Future<Either<Failure, void>> initSocket(String token, String userId);
  Future<Either<Failure, void>> sendGroupMessage(
    String groupId,
    String message,
    String token,
  );
  Future<Either<Failure, void>> getGroupMessages(
    String token,
    String groupId,
  );
  Stream<List<GroupMessageEntity>> get messagesStream;
}
