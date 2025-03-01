import 'package:flutter/material.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_drawer.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_view_body.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: ChatBotDrawer(),
      body: ChatBotViewBody(),
    );
  }
}
