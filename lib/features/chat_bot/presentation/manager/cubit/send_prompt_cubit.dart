import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/chat_bot/domain/entites/chat_bot_entity.dart';
import 'package:papyros/features/chat_bot/domain/use_cases/chat_bot_send_prompt_UseCase.dart';

part 'send_prompt_state.dart';

class SendPromptCubit extends Cubit<SendPromptState> {
  SendPromptCubit(
    this.chatBotSendPromptUseCase,
  ) : super(SendPromptInitial());
  final ChatBotSendPromptUseCase chatBotSendPromptUseCase;

  Future<void> sendPrompt({required String prompt}) async {
    emit(SendPromptLoading());
    final response = await chatBotSendPromptUseCase.call(prompt);
    response.fold(
      (failure) {
        emit(SendPromptFailure(errMessage: failure.toString()));
      },
      (chatBotEntity) {
        emit(SendPromptSuccess(chatBotEntity: chatBotEntity));
      },
    );
  }
}
