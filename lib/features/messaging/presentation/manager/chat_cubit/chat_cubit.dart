import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/messaging/domain/repos/chat_repo.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_states.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository repository;

  ChatCubit({required this.repository}) : super(ChatInitial());

  Future<void> connectToSocket(String token, String userId) async {
    emit(ChatLoading());
    final result = await repository.initSocket(token, userId);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (_) => emit(ChatConnected()),
    );
  }

  Future<void> fetchMessages(String toUserId) async {
    emit(ChatLoading());
    final result = await repository.getMessages(toUserId);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (messages) => emit(ChatMessagesLoaded(messages)),
    );
  }

  Future<void> sendMessage(
      String toUserId, String message, String token) async {
    final result = await repository.sendMessage(toUserId, message, token);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (_) => null,
    );
  }
}
