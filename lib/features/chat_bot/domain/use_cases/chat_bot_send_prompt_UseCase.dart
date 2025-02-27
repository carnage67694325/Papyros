import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/chat_bot/domain/repositories/chat_bot_repo.dart';

class ChatBotSendPromptUseCase {
  final ChatBotRepo repo;

  ChatBotSendPromptUseCase(this.repo);

  Future<Either<Failure, void>> call(String prompt) async {
    return await repo.sendPrompt(prompt);
  }
}
