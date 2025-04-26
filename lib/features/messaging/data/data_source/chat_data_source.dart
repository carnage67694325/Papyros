import 'package:papyros/features/messaging/data/model/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatSocketDatasource {
  late IO.Socket socket;

  final List<MessageModel> _cachedMessages = [];

  List<MessageModel> get cachedMessages => _cachedMessages;

  void connectSocket({required String token, required String userId}) {
    socket = IO.io('https://paramedia.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
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

  void emitGetMessages({required String token, required String toUserId}) {
    socket.emit('getMessages', {'token': token, 'to': toUserId});
  }

  void emitSendMessage(
      {required String token,
      required String toUserId,
      required String message}) {
    socket.emit(
        'sendMessage', {'token': token, 'to': toUserId, 'message': message});
  }
}
