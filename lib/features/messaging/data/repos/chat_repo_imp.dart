import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/features/messaging/data/data_source/chat_data_source.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';
import 'package:papyros/features/messaging/domain/repos/chat_repo.dart';
import '../../../../core/errors/failure.dart';
import 'dart:async'; // 👈 Important for Completer

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
      String token, String toUserId) async {
    try {
      final completer = Completer<Either<Failure, List<MessageEntity>>>();

      datasource.emitGetMessages(token: token, toUserId: toUserId);

      final subscription = datasource.getMessagesStream().listen(
        (messages) {
          completer.complete(Right(messages));
        },
        onError: (error) {
          completer.complete(Left(ServerFailure(error.toString())));
        },
      );

      final result = await completer.future;
      await subscription.cancel(); // Clean up after getting first result
      return result;
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
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
