import 'dart:async';
import 'dart:developer';

import 'package:papyros/features/messaging/data/model/message_model.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatSocketDatasource {
  late IO.Socket socket;
  final List<MessageModel> _cachedMessages = [];
  final controller = StreamController<List<MessageEntity>>();

  List<MessageModel> get cachedMessages => _cachedMessages;

  void connectSocket({required String token, required String userId}) {
    socket = IO.io('https://paramedia.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.onConnect((_) {
      socket.emit('join', userId);
      socket.emit('updateSocketId', {'token': token});
    });

    socket.on('newMessage', (data) {
      final message = MessageModel.fromJson(data['msg']);
      _cachedMessages.add(message);
    });
  }

  // Change here: Listening for messages instead of returning a value.
  void emitGetMessages({required String token, required String toUserId}) {
    socket.emit('getMessages', {'token': token, 'to': toUserId});
  }

  Stream<List<MessageEntity>> getMessagesStream() {
    socket.on('retrieveMessages', (data) {
      final List<MessageEntity> messages = (data['messages'] as List)
          .map((item) => MessageEntity(
                content: item['message'] as String,
                to: item['to'] as String,
                from: item['from'] as String,
              ))
          .toList();
      controller.add(messages);
      log('$messages');
    });

    return controller.stream;
  }

  void emitSendMessage(
      {required String token,
      required String toUserId,
      required String message}) {
    socket.emit(
        'sendMessage', {'token': token, 'to': toUserId, 'message': message});
  }
}
