import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/features/chat_bot/presentation/manager/cubit/send_prompt_cubit.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_app_bar.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_greetings_state.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_logo.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_message_list.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_respsne.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bubble.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/send_prompt_textfield.dart';

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key});
  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  List<Widget> messages = [];
  TextEditingController controller = TextEditingController();
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendPromptCubit, SendPromptState>(
      builder: (context, state) {
        if (state is SendPromptSuccess) {
          messages.add(ChatBotResponse(
            response: state.chatBotEntity.botResponse!,
          ));
          return Column(
            children: [
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 26),
                child: ChatBotAppBar(),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: ChatbotMessagesList(
                  messages: messages,
                  controller: scrollController,
                ),
              ),
              SendPromptTextfield(
                controller: controller,
                onSend: () async {
                  successSnackBar(context, "Message sent successfully");
                  setState(() {
                    messages.add(Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ChatBubble(
                        message: controller.text,
                      ),
                    ));
                  });
                  scrollToBottom();

                  await BlocProvider.of<SendPromptCubit>(context)
                      .sendPrompt(prompt: controller.text);
                  controller.clear();
                },
              ),
            ],
          );
        } else {
          return SendPromptTextfield(
              controller: controller,
              onSend: () async {
                successSnackBar(context, "Message sent successfully");
                messages.add(Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ChatBubble(
                    message: controller.text,
                  ),
                ));
                await BlocProvider.of<SendPromptCubit>(context)
                    .sendPrompt(prompt: controller.text);
              });
        }
      },
    );
  }
}
