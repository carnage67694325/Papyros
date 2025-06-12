import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/chat_room/domain/entities/group_message_entity.dart';
import 'package:papyros/features/chat_room/domain/repos/group_chat_repo.dart';
import 'package:papyros/features/chat_room/presentation/manager/group_chat_states.dart';

class GroupChatCubit extends Cubit<GroupChatState> {
  final GroupChatRepository repository;
  StreamSubscription<List<GroupMessageEntity>>? _messagesSubscription;
  List<GroupMessageEntity> groupMessagesList = [];
  String? currentUserId;

  GroupChatCubit({required this.repository}) : super(GroupChatInitial());

  Future<void> connectToSocket(String token, String userId) async {
    emit(GroupChatLoading());
    currentUserId = userId;
    final result = await repository.initSocket(token, userId);

    result.fold(
      (failure) => emit(GroupChatError(failure.errMessage)),
      (_) {
        emit(GroupChatConnected());
        _startListeningToGroupMessages();
      },
    );
  }

  void _startListeningToGroupMessages() {
    _messagesSubscription?.cancel();
    _messagesSubscription = repository.messagesStream.listen(
      (messages) {
        log("Received ${messages.length} group messages in stream");

        if (messages.length == 1) {
          final newMessage = messages.first;

          final isDuplicate = groupMessagesList.any((msg) =>
              msg.senderId == newMessage.senderId &&
              msg.groupId == newMessage.groupId &&
              msg.message == newMessage.message);

          if (!isDuplicate) {
            groupMessagesList.add(newMessage);
          }
        } else {
          groupMessagesList = List.from(messages);
        }

        emit(GroupMessagesLoaded(List.from(groupMessagesList)));
      },
      onError: (error) {
        emit(GroupChatError(error.toString()));
      },
    );
  }

  Future<void> getGroupMessages({
    required String token,
    required String groupId,
  }) async {
    emit(GroupMessagesLoading());

    final result = await repository.getGroupMessages(token, groupId);
    result.fold(
      (failure) => emit(GroupChatError(failure.errMessage)),
      (_) {},
    );
  }

  Future<void> sendGroupMessage({
    required String token,
    required String groupId,
    required String message,
  }) async {
    if (message.trim().isEmpty) return;

    final optimisticMessage = GroupMessageEntity(
      message: message,
      senderId: currentUserId ?? "unknown",
      groupId: groupId,
    );

    groupMessagesList.add(optimisticMessage);
    emit(GroupMessagesLoaded(List.from(groupMessagesList)));

    final result = await repository.sendGroupMessage(groupId, message, token);

    result.fold(
      (failure) {
        groupMessagesList.remove(optimisticMessage);
        emit(GroupChatError(failure.errMessage));
        emit(GroupMessagesLoaded(List.from(groupMessagesList)));
      },
      (_) => emit(GroupMessageSent()),
    );
  }

  void refreshGroupMessages() {
    if (groupMessagesList.isNotEmpty) {
      emit(GroupMessagesLoaded(List.from(groupMessagesList)));
    }
  }

  @override
  Future<void> close() async {
    await _messagesSubscription?.cancel();
    return super.close();
  }
}
