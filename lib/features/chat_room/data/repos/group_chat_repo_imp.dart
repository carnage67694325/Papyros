import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/chat_room/data/data_source/chat_room_data_source.dart';
import 'package:papyros/features/chat_room/domain/entities/group_message_entity.dart';
import 'package:papyros/features/chat_room/domain/repos/group_chat_repo.dart';

class GroupChatRepositoryImpl implements GroupChatRepository {
  final GroupChatSocketDatasource datasource;

  GroupChatRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, void>> initSocket(String token, String userId) async {
    try {
      datasource.connectSocket(token: token, userId: userId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendGroupMessage(
    String groupId,
    String message,
    String token,
  ) async {
    try {
      datasource.emitSendGroupMessage(
        token: token,
        groupId: groupId,
        message: message,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> getGroupMessages(
    String token,
    String groupId,
  ) async {
    try {
      datasource.emitGetGroupMessages(token: token, groupId: groupId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<List<GroupMessageEntity>> get messagesStream =>
      datasource.getGroupMessagesStream();
}
