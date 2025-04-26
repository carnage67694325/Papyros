import 'package:flutter/material.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/chat_app_bar.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/chat_view_body.dart';

class MessageChatView extends StatelessWidget {
  const MessageChatView(
      {super.key,
      required this.userName,
      required this.userImage,
      required this.userID});
  final String userName;
  final String userImage;
  final String userID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ChatAppBar(userImage: userImage, userName: userName),
        ),
        body: ChatViewBody(
          userName: userName,
          userImage: userImage,
        ));
  }
}
