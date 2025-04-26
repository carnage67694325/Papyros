import 'package:papyros/features/messaging/domain/entites/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required super.id,
    required super.from,
    required super.to,
    required super.content,
    required super.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'],
      from: json['from'],
      to: json['to'],
      content: json['message'],
      timestamp: DateTime.parse(json['createdAt']),
    );
  }
}
