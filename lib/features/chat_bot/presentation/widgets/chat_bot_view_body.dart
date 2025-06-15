import 'dart:io';

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
import 'package:papyros/features/home/presentation/view/manager/pick_post_image/pick_post_image_cubit.dart';

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key});
  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  final TextEditingController controller = TextEditingController();

  final List<Widget> messages = [];
  bool isLoadingAdded = false;

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  void handleImagePick(BuildContext context) {
    BlocProvider.of<PickPostImageCubit>(context).pickImageFromGallery();
  }

  void addImageMessage(String imagePath) {
    setState(() {
      messages.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Align(
            alignment: Alignment.centerRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.file(
                File(imagePath),
                width: 150.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    });

    scrollToBottom();

    BlocProvider.of<SendPromptCubit>(context).sendPrompt(
      prompt: '',
      image: imagePath,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PickPostImageCubit, PickPostImageState>(
          listener: (context, state) {
            if (state is PickPostImageFaliure) {
              errorSnackBar(context, state.errMessage);
            } else if (state is PickPostImageSuccess) {
              addImageMessage(state.imagePath);
            }
          },
        ),
        BlocListener<SendPromptCubit, SendPromptState>(
          listener: (context, state) {
            if (state is SendPromptInitial) {
              messages.clear();
              isLoadingAdded = false;
            } else if (state is SendPromptFailure) {
              errorSnackBar(context, state.errMessage);
              if (isLoadingAdded) {
                messages.removeLast();
                isLoadingAdded = false;
              }
            } else if (state is SendPromptLoading && !isLoadingAdded) {
              messages.add(const AppLoadingAnimation(size: 35));
              isLoadingAdded = true;
              setState(() {});
            } else if (state is SendPromptSuccess) {
              if (isLoadingAdded) {
                messages.removeLast();
                isLoadingAdded = false;
              }

              messages.add(
                ChatBotResponse(
                  response: state.chatBotEntity.botResponse!,
                  scrollController: scrollController,
                ),
              );
              scrollToBottom();
              setState(() {});
            }
          },
        ),
      ],
      child: Column(
        children: [
          SizedBox(height: 45.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const ChatBotAppBar(),
          ),
          SizedBox(height: 50.h),
          Expanded(
            child: messages.isEmpty
                ? const ChatbotGreetingState()
                : ChatbotMessagesList(
                    messages: messages,
                    controller: scrollController,
                  ),
          ),
          SendPromptTextfield(
            controller: controller,
            onSend: () async {
              if (controller.text.trim().isEmpty) return;

              setState(() {
                messages.add(
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: ChatBubble(message: controller.text.trim()),
                  ),
                );
              });

              scrollToBottom();

              await BlocProvider.of<SendPromptCubit>(context).sendPrompt(
                prompt: controller.text.trim(),
              );

              controller.clear();
            },
            onPickImage: () => handleImagePick(context),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
