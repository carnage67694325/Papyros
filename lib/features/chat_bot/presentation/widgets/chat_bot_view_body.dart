import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_app_bar.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bubble.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/send_prompt_textfield.dart';

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key});

  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 26),
                child: ChatBotAppBar(),
              ),
              SizedBox(
                height: 50,
              ),
              ChatBubble(
                message:
                    'hamada is the one and true friend of mine and he is the best and always be okay with me ',
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        const Spacer(),
        SendPromptTextfield(
            controller: TextEditingController(),
            onSend: () {
              successSnackBar(context, "Message sent successfully");
            }),
      ],
    );
  }
}
