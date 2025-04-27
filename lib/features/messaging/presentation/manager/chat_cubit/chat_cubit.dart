import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';
import 'package:papyros/features/messaging/domain/repos/chat_repo.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_states.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository repository;
  late StreamSubscription<List<MessageEntity>> _messagesSubscription;
  List<MessageEntity> messagesList = [];

  ChatCubit({required this.repository}) : super(ChatInitial());

  Future<void> connectToSocket(String token, String userId) async {
    emit(ChatLoading());
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
    _messagesSubscription = repository.messagesStream.listen(
      (incomingMessages) {
        log("Received ${incomingMessages.length} messages in stream");

        for (var incomingMessage in incomingMessages) {
          // Try to find and remove the optimistic message
          messagesList.removeWhere((existingMessage) =>
              existingMessage.content == incomingMessage.content &&
              existingMessage.from == "local" &&
              existingMessage.to == incomingMessage.to);

          // Always add the incoming real message
          messagesList.add(incomingMessage);
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
    // Optimistically add message to list
    final optimisticMessage = MessageEntity(
      content: message,
      from: "local", // Replace with actual user ID if available
      to: toUserId,
    );

    // Only add optimistic message if actually sending a real message
    if (message.trim().isNotEmpty) {
      messagesList.add(optimisticMessage);
      emit(ChatMessagesLoaded(List.from(messagesList)));
    }

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
    await _messagesSubscription.cancel();
    return super.close();
  }
}
