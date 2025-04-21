import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool? isSender;
  const ChatBubble({
    super.key,
    required this.message,
    this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialOne(
      text: message,
      color: AppColors.lightPeach,
      isSender: isSender ?? true,
    );
  }
}
