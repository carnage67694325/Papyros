import 'package:flutter/material.dart';
import 'package:papyros/features/chat_room/presentation/view/widgets/chat_room_view_body.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key, required this.groupId});
  final String groupId;
  @override
  Widget build(BuildContext context) {
    return const ChatRoomViewBody();
  }
}
