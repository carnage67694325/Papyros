import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/chat_room/domain/entities/group_message_entity.dart';
import 'package:papyros/features/chat_room/domain/repos/group_chat_repo.dart';
import 'package:papyros/features/chat_room/presentation/manager/group_chat_states.dart';

class GroupChatCubit extends Cubit<GroupChatState> {
  final GroupChatRepository repository;
  StreamSubscription<List<GroupMessageEntity>>? _messagesSubscription;
  String? currentUserId;
  String? _currentGroupId;

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
        log("Received ${messages.length} group messages from stream");

        if (_currentGroupId == null) return;

        final filteredMessages =
            messages.where((msg) => msg.groupId == _currentGroupId).toList();

        emit(GroupMessagesLoaded(filteredMessages));
      },
      onError: (error) {
        final msg = error.toString();
        log("Socket error: $msg");

        if (msg.contains("not a member")) {
          emit(GroupChatError("You are not a member of this group."));
        } else {
          emit(GroupChatError(msg));
        }
      },
    );
  }

  Future<void> getGroupMessages({
    required String token,
    required String groupId,
  }) async {
    _currentGroupId = groupId;
    emit(GroupMessagesLoading());

    final result = await repository.getGroupMessages(token, groupId);

    result.fold(
      (failure) => emit(GroupChatError(failure.errMessage)),
      (_) {
        emit(GroupChatConnected());
        _startListeningToGroupMessages();
      },
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

    // Emit optimistically
    final currentState = state;
    if (currentState is GroupMessagesLoaded) {
      final updated = List<GroupMessageEntity>.from(currentState.messages)
        ..add(optimisticMessage);
      emit(GroupMessagesLoaded(updated));
    }

    final result = await repository.sendGroupMessage(groupId, message, token);

    result.fold(
      (failure) {
        // Remove optimistic if it failed
        if (state is GroupMessagesLoaded) {
          final updated = List<GroupMessageEntity>.from(
              (state as GroupMessagesLoaded).messages)
            ..remove(optimisticMessage);
          emit(GroupChatError(failure.errMessage));
          emit(GroupMessagesLoaded(updated));
        } else {
          emit(GroupChatError(failure.errMessage));
        }
      },
      (_) => emit(GroupMessageSent()),
    );
  }

  @override
  Future<void> close() async {
    await _messagesSubscription?.cancel();
    return super.close();
  }
}
