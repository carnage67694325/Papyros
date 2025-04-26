import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/messaging/domain/repos/chat_repo.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_states.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository repository;
  // Store the last loaded messages to avoid showing loading state
  List<MessageEntity> _cachedMessages = [];

  ChatCubit({required this.repository}) : super(ChatInitial());

  Future<void> connectToSocket(String token, String userId) async {
    emit(ChatLoading());
    final result = await repository.initSocket(token, userId);
    result.fold(
      (failure) => emit(ChatError(failure.errMessage)),
      (_) => emit(ChatConnected()),
    );
  }

  Future<void> fetchMessages(String token, String toUserId) async {
    emit(MessageLoading());
    final result = await repository.getMessages(token, toUserId);
    result.fold(
      (failure) => emit(ChatError(failure.errMessage)),
      (messages) {
        _cachedMessages = messages;
        emit(ChatMessagesLoaded(messages));
      },
    );
  }

  // New method that refreshes messages without showing loading state
  Future<void> refreshMessagesWithoutLoading(
      String token, String toUserId) async {
    // Keep current state visible to user
    final currentState = state;

    final result = await repository.getMessages(token, toUserId);
    result.fold(
      (failure) {
        // Only update state if there's an error
        emit(ChatError(failure.errMessage));
      },
      (messages) {
        _cachedMessages = messages;
        emit(ChatMessagesLoaded(messages));
      },
    );
  }

  Future<void> sendMessage(
      String toUserId, String message, String token) async {
    // Don't emit loading state for sending
    final result = await repository.sendMessage(toUserId, message, token);
    result.fold(
      (failure) => emit(ChatError(failure.errMessage)),
      (_) {
        // Emit MessageSent state for the snackbar
        emit(MessageSent());

        // If we have cached messages, restore their state
        if (_cachedMessages.isNotEmpty) {
          emit(ChatMessagesLoaded(_cachedMessages));
        }
      },
    );
  }
}
