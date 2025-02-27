part of 'send_prompt_cubit.dart';

@immutable
sealed class SendPromptState {}

final class SendPromptInitial extends SendPromptState {}

final class SendPromptLoading extends SendPromptState {}

final class SendPromptFailure extends SendPromptState {
  final String errMessage;

  SendPromptFailure({required this.errMessage});
}

final class SendPromptSuccess extends SendPromptState {
  final ChatBotEntity chatBotEntity;

  SendPromptSuccess({required this.chatBotEntity});
}
