import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bubble.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: const ChatBubble(message: "Hello, how are you?"),
            ));
  }
}
