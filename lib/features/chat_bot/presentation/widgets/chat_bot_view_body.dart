import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_app_bar.dart';

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key});

  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 22, right: 26),
                child: ChatBotAppBar(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
