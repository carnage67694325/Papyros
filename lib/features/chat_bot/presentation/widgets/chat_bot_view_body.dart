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
  final ScrollController scrollController = ScrollController();
  final TextEditingController controller = TextEditingController();
  final List<Widget> messages = [];

  bool isLoadingAdded = false;
  bool isSending = false;

  bool _shouldAutoScroll() {
    if (!scrollController.hasClients) return false;
    return scrollController.offset >=
        scrollController.position.maxScrollExtent - 300;
  }

  void _scrollToBottom({bool force = false}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) return;
      if (force || _shouldAutoScroll()) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _addMessage(Widget message, {bool forceScroll = false}) {
    setState(() => messages.add(message));
    _scrollToBottom(force: forceScroll);
  }

  void _addImageMessage(String imagePath) {
    final imageWidget = Padding(
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
    );

    _addMessage(imageWidget, forceScroll: true);

    BlocProvider.of<SendPromptCubit>(context).sendPrompt(
      prompt: '',
      image: imagePath,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    super.dispose();
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
              _addImageMessage(state.imagePath);
            }
          },
        ),
        BlocListener<SendPromptCubit, SendPromptState>(
          listener: (context, state) {
            if (state is SendPromptInitial) {
              setState(() {
                messages.clear();
                isLoadingAdded = false;
              });
              return;
            }

            if (state is SendPromptFailure) {
              errorSnackBar(context, state.errMessage);
              if (isLoadingAdded && messages.isNotEmpty) {
                setState(() {
                  messages.removeLast();
                  isLoadingAdded = false;
                });
              }
              return;
            }

            if (state is SendPromptLoading && !isLoadingAdded) {
              _addMessage(const AppLoadingAnimation(size: 35),
                  forceScroll: true);
              isLoadingAdded = true;
              return;
            }

            if (state is SendPromptSuccess) {
              if (isLoadingAdded && messages.isNotEmpty) {
                setState(() {
                  messages.removeLast();
                  isLoadingAdded = false;
                });
              }

              _addMessage(
                ChatBotResponse(
                  response: state.chatBotEntity.botResponse!,
                  scrollController: scrollController,
                  audioRespone: state.chatBotEntity.botAudio!,
                ),
                forceScroll: true,
              );
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
              final text = controller.text.trim();
              if (text.isEmpty || isSending) return;

              setState(() {
                isSending = true;
              });

              _addMessage(
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: ChatBubble(message: text),
                ),
                forceScroll: true,
              );

              controller.clear();

              await BlocProvider.of<SendPromptCubit>(context).sendPrompt(
                prompt: text,
              );

              if (mounted) {
                setState(() => isSending = false);
              }
            },
            onPickFromGallery: () =>
                BlocProvider.of<PickPostImageCubit>(context)
                    .pickImageFromGallery(),
            onPickFromCamera: () => BlocProvider.of<PickPostImageCubit>(context)
                .pickImageFromCamera(),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
