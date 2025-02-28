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
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bubble.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/send_prompt_textfield.dart';

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key});
  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> messages = [];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendPromptCubit, SendPromptState>(
      builder: (context, state) {
        if (state is SendPromptSuccess || state is SendPromptInitial) {
          return Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 26),
                      child: ChatBotAppBar(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ChatbotMessagesList(messages: messages),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              "hello",
                              style: AppStyles.chatHeader.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                wordSpacing: 1.0,
                              ),
                              softWrap: true,
                            ),
                          ),
                          const ChatBotLogo(
                            height: 35,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              SendPromptTextfield(
                  controller: controller,
                  onSend: () {
                    successSnackBar(context, "Message sent successfully");
                    messages.add(ChatBubble(
                      message: controller.text,
                    ));
                    BlocProvider.of<SendPromptCubit>(context)
                        .sendPrompt(prompt: controller.text);
                  }),
            ],
          );
        } else {
          return const ChatbotGreetingState();
        }
      },
    );
  }
}
