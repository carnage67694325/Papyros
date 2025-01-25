import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_app_bar.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_logo.dart';
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 22, right: 26),
                child: ChatBotAppBar(),
              ),
              const SizedBox(height: 179),
              const ChatBotLogo(),
              const SizedBox(height: 410),
              SendPromptTextfield(
                  controller: TextEditingController(),
                  onSend: () {
                    successSnackBar(context, "Message sent successfully");
                  })
            ],
          ),
        )
      ],
    );
  }
}
