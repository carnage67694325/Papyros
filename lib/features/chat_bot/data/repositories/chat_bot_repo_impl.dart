import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/chat_bot/data/data_source/send_prompt_data_source.dart';
import 'package:papyros/features/chat_bot/data/model/chat_bot_Model.dart';
import 'package:papyros/features/chat_bot/domain/entites/chat_bot_entity.dart';
import 'package:papyros/features/chat_bot/domain/repositories/chat_bot_repo.dart';

class ChatBotRepoImpl implements ChatBotRepo {
  final SendPromptDataSource sendPromptDataSource;

  ChatBotRepoImpl({required this.sendPromptDataSource});

  @override
  Future<Either<Failure, ChatBotEntity>> sendPrompt(String message) async {
    try {
      final response = await sendPromptDataSource.sendPrompt(prompt: message);
      // Create a ChatBotEntity with the response data
      return Right(ChatBotModel(
        userInput: message,
        text: response['text'], // Pass the API response
      ));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
