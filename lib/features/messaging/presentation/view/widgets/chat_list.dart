import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_states.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bubble.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatError) {
          log('Chat Error: ${state.errMessage}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is ChatLoading) {
          return SliverToBoxAdapter(
            child: Center(
              child: AppLoadingAnimation(size: 50.h),
            ),
          );
        } else if (state is ChatMessagesLoaded) {
          if (state.messages.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child:
                    Text('No messages yet.', style: TextStyle(fontSize: 16.sp)),
              ),
            );
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final message = state.messages[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: ChatBubble(message: message.content),
                );
              },
              childCount: state.messages.length,
            ),
          );
        } else if (state is ChatError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16.sp)),
            ),
          );
        } else if (state is ChatConnected) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('Connected. Waiting for messages...',
                  style: TextStyle(fontSize: 16.sp)),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('Initializing chat...',
                  style: TextStyle(fontSize: 16.sp)),
            ),
          );
        }
      },
    );
  }
}
