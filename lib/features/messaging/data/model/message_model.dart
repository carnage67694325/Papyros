// message_model.dart
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required super.from,
    required super.to,
    required super.content,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      from: json['from'] ?? '',
      to: json['to'] ?? '',
      content: json['message'] ?? '', // The message body is inside 'message'
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
      'message': content,
    };
  }
}
