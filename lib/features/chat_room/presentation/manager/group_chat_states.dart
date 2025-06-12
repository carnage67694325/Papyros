import 'package:papyros/features/messaging/domain/entites/message_entity.dart';

abstract class GroupChatState {}

class GroupChatInitial extends GroupChatState {}

class GroupChatLoading extends GroupChatState {}

class GroupChatConnected extends GroupChatState {}

class GroupMessagesLoading extends GroupChatState {}

class GroupMessagesLoaded extends GroupChatState {
  final List<MessageEntity> messages;
  GroupMessagesLoaded(this.messages);
}

class GroupMessageSent extends GroupChatState {}

class GroupChatError extends GroupChatState {
  final String message;
  GroupChatError(this.message);
}
