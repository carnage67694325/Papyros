import 'dart:async';
import 'dart:developer';

import 'package:papyros/features/messaging/data/model/message_model.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatSocketDatasource {
  late IO.Socket socket;
  final List<MessageModel> _cachedMessages = [];
  final StreamController<List<MessageEntity>> _controller =
      StreamController.broadcast();

  List<MessageModel> get cachedMessages => _cachedMessages;

  void connectSocket({required String token, required String userId}) {
    socket = IO.io('https://paramedia.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.onConnect((_) {
      log('Socket connected: ${socket.id}');
      socket.emit('join', userId);
      socket.emit('updateSocketId', {'token': token});
    });

    socket.on('newMessage', (data) {
      final message = MessageModel.fromJson(data['msg']);
      _cachedMessages.add(message);
      _controller
          .add(List<MessageEntity>.from(_cachedMessages)); // update stream
    });

    socket.on('retrieveMessages', (data) {
      final messages = (data['messages'] as List)
          .map((item) => MessageEntity(
                content: item['message'] as String,
                to: item['to'] as String,
                from: item['from'] as String,
              ))
          .toList();
      _controller.add(messages);
      log('Retrieved messages: $messages');
    });

    socket.on('error', (data) {
      log('Socket error: ${data['message']}');
    });
  }

  void emitGetMessages({required String token, required String toUserId}) {
    log(toUserId);
    socket.emit('getMessages', {'token': token, 'to': toUserId});
  }

  void emitSendMessage({
    required String token,
    required String toUserId,
    required String message,
  }) {
    socket.emit(
        'sendMessage', {'token': token, 'to': toUserId, 'message': message});
  }

  Stream<List<MessageEntity>> getMessagesStream() {
    return _controller.stream;
  }

  void dispose() {
    socket.dispose();
    _controller.close();
  }
}
