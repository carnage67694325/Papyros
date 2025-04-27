import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/messaging/data/data_source/chat_data_source.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';
import 'package:papyros/features/messaging/domain/repos/chat_repo.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatSocketDatasource datasource;

  ChatRepositoryImpl({required this.datasource});

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
  Future<Either<Failure, void>> sendMessage(
      String toUserId, String message, String token) async {
    try {
      datasource.emitSendMessage(
          token: token, toUserId: toUserId, message: message);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> getMessages(
      String token, String toUserId) async {
    try {
      datasource.emitGetMessages(token: token, toUserId: toUserId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<List<MessageEntity>> get messagesStream =>
      datasource.getMessagesStream();
}
