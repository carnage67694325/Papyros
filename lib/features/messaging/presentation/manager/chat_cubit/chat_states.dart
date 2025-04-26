import 'package:papyros/features/messaging/domain/entites/message_entity.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatConnected extends ChatState {}

class ChatMessagesLoaded extends ChatState {
  final List<MessageEntity> messages;
  ChatMessagesLoaded(this.messages);
}

class ChatError extends ChatState {
  final String errMessage;
  ChatError(this.errMessage);
}
