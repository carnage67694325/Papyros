import 'package:flutter/widgets.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_app_bar.dart';

class ChatBotViewBody extends StatelessWidget {
  const ChatBotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ChatBotAppBar(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
