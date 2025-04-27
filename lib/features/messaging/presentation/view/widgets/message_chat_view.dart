import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/chat_app_bar.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/chat_view_body.dart';

class MessageChatView extends StatefulWidget {
  const MessageChatView(
      {super.key,
      required this.userName,
      required this.userImage,
      required this.toUserID,
      required this.token,
      required this.userID});
  final String userName;
  final String userImage;
  final String toUserID;
  final String userID;

  final String token;

  @override
  State<MessageChatView> createState() => _MessageChatViewState();
}

class _MessageChatViewState extends State<MessageChatView> {
  @override
  void initState() {
    log(widget.toUserID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ChatAppBar(
              userImage: widget.userImage, userName: widget.userName),
        ),
        body: ChatViewBody(
          userName: widget.userName,
          userImage: widget.userImage,
          toUserId: widget.toUserID,
          token: widget.token,
          userId: widget.userID,
        ));
  }
}
