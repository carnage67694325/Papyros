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
      'autoConnect': true,
    });

    socket.connect();

    socket.onConnect((_) {
      log('Socket connected: ${socket.id}');
      socket.emit('join', userId);
      socket.emit('updateSocketId', {'token': token});
    });

    // Clear cached messages when reconnecting
    _cachedMessages.clear();

    socket.on('newMessage', (data) {
      log('New message received: $data');
      final message = MessageModel.fromJson(data['msg']);
      _cachedMessages.add(message);

      // Convert to entities and update stream
      final entities = _cachedMessages.map((m) => m.toEntity()).toList();
      _controller.add(entities);
    });

    socket.on('retrieveMessages', (data) {
      log('Retrieved messages from server: ${data['messages']}');

      // Clear previous messages when receiving history
      _cachedMessages.clear();

      final messages = (data['messages'] as List)
          .map((item) => MessageModel.fromJson(item))
          .toList();

      // Add all messages to cache
      _cachedMessages.addAll(messages);

      // Convert to entities and update stream
      final entities = _cachedMessages.map((m) => m.toEntity()).toList();
      _controller.add(entities);
    });

    socket.on('error', (data) {
      log('Socket error: ${data['message']}');
    });

    // Handle disconnect and reconnect events
    socket.on('disconnect', (_) {
      log('Socket disconnected');
    });

    socket.on('reconnect', (_) {
      log('Socket reconnected');
      socket.emit('join', userId);
      socket.emit('updateSocketId', {'token': token});
    });
  }

  void emitGetMessages({required String token, required String toUserId}) {
    log('Requesting messages for user: $toUserId');
    socket.emit('getMessages', {'token': token, 'to': toUserId});
  }

  void emitSendMessage({
    required String token,
    required String toUserId,
    required String message,
  }) {
    log('Sending message to user: $toUserId');
    socket.emit(
        'sendMessage', {'token': token, 'to': toUserId, 'message': message});
  }

  Stream<List<MessageEntity>> getMessagesStream() {
    return _controller.stream;
  }

  void dispose() {
    socket.disconnect();
    socket.dispose();
    _controller.close();
  }
}
