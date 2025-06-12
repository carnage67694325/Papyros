import 'package:papyros/features/chat_room/domain/entities/group_message_entity.dart';

class GroupMessageModel {
  final String message;
  final String groupId;
  final String senderId;

  GroupMessageModel({
    required this.message,
    required this.groupId,
    required this.senderId,
  });

  factory GroupMessageModel.fromJson(Map<String, dynamic> json) {
    return GroupMessageModel(
      message: json['message'] ?? '',
      groupId: json['group'] is Map ? json['group']['_id'] : json['group'],
      senderId: json['from'] is Map ? json['from']['_id'] : json['from'],
    );
  }

  GroupMessageEntity toEntity() {
    return GroupMessageEntity(
      message: message,
      groupId: groupId,
      senderId: senderId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'group': groupId,
      'from': senderId,
    };
  }
}
