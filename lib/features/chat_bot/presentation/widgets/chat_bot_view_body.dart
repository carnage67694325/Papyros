import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/features/chat_bot/presentation/manager/cubit/send_prompt_cubit.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_app_bar.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_greetings_state.dart';
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
  bool isLoadingAdded = false;
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendPromptCubit, SendPromptState>(
      listener: (context, state) {
        if (state is SendPromptInitial) {
          messages.clear();
          isLoadingAdded = false;
        } else if (state is SendPromptFailure) {
          errorSnackBar(context, state.errMessage);
          if (isLoadingAdded) {
            messages.removeLast(); // Remove loading animation on failure
            isLoadingAdded = false;
          }
        } else if (state is SendPromptLoading && !isLoadingAdded) {
          messages.add(const AppLoadingAnimation(
            size: 35,
          ));
          isLoadingAdded = true;
          setState(() {});
        } else if (state is SendPromptSuccess) {
          if (isLoadingAdded) {
            messages.removeLast(); // Remove loading animation on success
            isLoadingAdded = false;
          }
          scrollToBottom();
        }
      },
      builder: (context, state) {
        if (state is SendPromptSuccess) {
          messages.add(ChatBotResponse(
            response: state.chatBotEntity.botResponse!,
            scrollController: scrollController,
          ));
          return Column(
            children: [
              SizedBox(height: 45.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 26.w,
                ),
                child: const ChatBotAppBar(),
              ),
              SizedBox(height: 50.h),
              Expanded(
                child: ChatbotMessagesList(
                  messages: messages,
                  controller: scrollController,
                ),
              ),
              SendPromptTextfield(
                controller: controller,
                onSend: () async {
                  setState(() {
                    messages.add(Padding(
                      padding: EdgeInsets.only(bottom: 8.0.h, top: 8.0.h),
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
              SizedBox(height: 40.h),
            ],
          );
        } else {
          return Column(
            children: [
              SizedBox(height: 45.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 26.w),
                child: const ChatBotAppBar(),
              ),
              SizedBox(height: 50.h),
              Expanded(
                child: state is SendPromptInitial
                    ? const ChatbotGreetingState()
                    : ChatbotMessagesList(
                        messages: messages,
                        controller: scrollController,
                      ),
              ),
              SendPromptTextfield(
                controller: controller,
                onSend: () async {
                  if (controller.text.isNotEmpty) {
                    setState(() {
                      messages.add(Padding(
                        padding: EdgeInsets.only(bottom: 8.0.h),
                        child: ChatBubble(
                          message: controller.text,
                        ),
                      ));
                    });
                    scrollToBottom();

                    await BlocProvider.of<SendPromptCubit>(context)
                        .sendPrompt(prompt: controller.text);
                    controller.clear();
                  } else {}
                },
              ),
              SizedBox(height: 40.h),
            ],
          );
        }
      },
    );
  }
}
