import 'package:papyros/features/chat_room/domain/entities/group_message_entity.dart';

abstract class GroupChatState {}

class GroupChatInitial extends GroupChatState {}

class GroupChatLoading extends GroupChatState {}

class GroupChatConnected extends GroupChatState {}

class GroupMessagesLoading extends GroupChatState {}

class GroupMessagesLoaded extends GroupChatState {
  final List<GroupMessageEntity> messages;
  GroupMessagesLoaded(this.messages);
}

class GroupMessageSent extends GroupChatState {}

class GroupChatError extends GroupChatState {
  final String errMessage;
  GroupChatError(this.errMessage);
}
