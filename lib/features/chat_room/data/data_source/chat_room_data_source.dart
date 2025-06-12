import 'dart:async';
import 'dart:developer';
import 'package:papyros/features/chat_room/domain/entities/group_message_entity.dart';
import 'package:papyros/features/chat_room/data/models/group_message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class GroupChatSocketDatasource {
  late IO.Socket socket;
  final StreamController<List<GroupMessageEntity>> _controller =
      StreamController.broadcast();

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

    socket.on('newGroupMessage', (data) {
      log('New group message received: $data');
      final msg = GroupMessageModel.fromJson(data['messg']);
      _controller.add([msg.toEntity()]);
    });

    socket.on('retrieveGroupMessages', (data) {
      log('Retrieved group messages: ${data['messages']}');
      final messages = (data['messages'] as List)
          .map((item) => GroupMessageModel.fromJson(item))
          .toList();
      final entities = messages.map((e) => e.toEntity()).toList();
      _controller.add(entities);
    });

    socket.on('error', (data) {
      log('Socket error: ${data['message']}');
    });

    socket.on('disconnect', (_) {
      log('Socket disconnected');
    });

    socket.on('reconnect', (_) {
      log('Socket reconnected');
      socket.emit('join', userId);
      socket.emit('updateSocketId', {'token': token});
    });
  }

  void emitGetGroupMessages({
    required String token,
    required String groupId,
  }) {
    log('Requesting messages for group: $groupId');
    socket.emit('getGroupMessages', {
      'token': token,
      'groupId': groupId,
    });
  }

  void emitSendGroupMessage({
    required String token,
    required String groupId,
    required String message,
  }) {
    log('Sending message to group: $groupId');
    socket.emit('SendGroupMessage', {
      'token': token,
      'groupId': groupId,
      'message': message,
    });
  }

  Stream<List<GroupMessageEntity>> getGroupMessagesStream() {
    return _controller.stream;
  }

  void dispose() {
    socket.disconnect();
    socket.dispose();
    _controller.close();
  }
}
