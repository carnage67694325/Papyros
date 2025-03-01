import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/chat_bot/domain/repositories/chat_bot_repo.dart';
import 'package:papyros/features/chat_bot/domain/entites/chat_bot_entity.dart';

class ChatBotSendPromptUseCase {
  final ChatBotRepo repo;

  ChatBotSendPromptUseCase(this.repo);

  Future<Either<Failure, ChatBotEntity>> call(String prompt) async {
    return await repo.sendPrompt(prompt);
  }
}
