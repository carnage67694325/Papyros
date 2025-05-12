import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';
import 'package:papyros/features/messaging/domain/repos/chat_repo.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_states.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository repository;
  StreamSubscription<List<MessageEntity>>? _messagesSubscription;
  List<MessageEntity> messagesList = [];
  String? currentUserId;

  ChatCubit({required this.repository}) : super(ChatInitial());

  Future<void> connectToSocket(String token, String userId) async {
    emit(ChatLoading());
    currentUserId = userId;
    final result = await repository.initSocket(token, userId);

    result.fold(
      (failure) => emit(ChatError(failure.errMessage)),
      (_) {
        emit(ChatConnected());
        _startListeningToMessages();
      },
    );
  }

  void _startListeningToMessages() {
    _messagesSubscription?.cancel(); // cancel if exists
    _messagesSubscription = repository.messagesStream.listen(
      (messages) {
        log("Received ${messages.length} messages in stream");

        if (messages.length == 1) {
          // This is likely a single new message
          // Add it to our existing list instead of replacing everything
          final newMessage = messages.first;

          // Check if this message already exists in our list to avoid duplicates
          final isDuplicate = messagesList.any((existingMsg) =>
              existingMsg.from == newMessage.from &&
              existingMsg.to == newMessage.to &&
              existingMsg.content == newMessage.content);

          if (!isDuplicate) {
            messagesList.add(newMessage);
          }
        } else {
          // This is likely the full message history
          // Replace our list with the new one
          messagesList = List.from(messages);
        }

        emit(ChatMessagesLoaded(List.from(messagesList)));
      },
      onError: (error) {
        emit(ChatError(error.toString()));
      },
    );
  }

  Future<void> getMessages({
    required String token,
    required String toUserId,
  }) async {
    emit(MessageLoading());

    final result = await repository.getMessages(token, toUserId);
    result.fold(
      (failure) => emit(ChatError(failure.errMessage)),
      (_) {
        // Messages will be received via the stream,
        // but we emit loading state while waiting
      },
    );
  }

  Future<void> sendMessage({
    required String token,
    required String toUserId,
    required String message,
  }) async {
    if (message.trim().isEmpty) return;

    // Create optimistic message
    final optimisticMessage = MessageEntity(
      content: message,
      from: currentUserId ?? "unknown", // Use actual user ID instead of "local"
      to: toUserId,
    );

    // Add optimistic message to list
    messagesList.add(optimisticMessage);
    emit(ChatMessagesLoaded(List.from(messagesList)));

    final result = await repository.sendMessage(toUserId, message, token);
    result.fold(
      (failure) {
        // Remove optimistic message on failure
        messagesList.remove(optimisticMessage);
        emit(ChatError(failure.errMessage));
        emit(ChatMessagesLoaded(
            List.from(messagesList))); // Re-emit correct list
      },
      (_) => emit(MessageSent()),
    );
  }

  void refreshMessages() {
    if (messagesList.isNotEmpty) {
      emit(ChatMessagesLoaded(List.from(messagesList)));
    }
  }

  @override
  Future<void> close() async {
    await _messagesSubscription?.cancel();
    return super.close();
  }
}
