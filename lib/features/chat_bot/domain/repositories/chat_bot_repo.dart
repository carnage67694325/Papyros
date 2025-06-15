import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/chat_bot/domain/entites/chat_bot_entity.dart';

abstract class ChatBotRepo {
  Future<Either<Failure, ChatBotEntity>> sendPrompt(
      String message, String? image);
}
