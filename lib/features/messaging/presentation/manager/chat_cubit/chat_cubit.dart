import 'dart:async';
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
      (messages) {
        messagesList = messages;
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
    final result = await repository.getMessages(token, toUserId);
    result.fold(
      (failure) => emit(ChatError(failure.errMessage)),
      (_) {
        // No need to emit anything here, messages will be received via the stream
      },
    );
  }

  Future<void> sendMessage({
    required String token,
    required String toUserId,
    required String message,
  }) async {
    final result = await repository.sendMessage(toUserId, message, token);
    result.fold(
      (failure) => emit(ChatError(failure.errMessage)),
      (_) => emit(MessageSent()),
    );
  }

  @override
  Future<void> close() async {
    await _messagesSubscription.cancel();
    return super.close();
  }
}
