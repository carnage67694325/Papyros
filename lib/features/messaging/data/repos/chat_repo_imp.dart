import 'package:dartz/dartz.dart';
import 'package:papyros/features/messaging/data/data_source/chat_data_source.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';
import 'package:papyros/features/messaging/domain/repos/chat_repo.dart';
import '../../../../core/errors/failure.dart';

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
  Future<Either<Failure, List<MessageEntity>>> getMessages(
      String toUserId) async {
    try {
      // This just gets cached messages for now.
      final messages = datasource.cachedMessages;
      return Right(messages);
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
}
