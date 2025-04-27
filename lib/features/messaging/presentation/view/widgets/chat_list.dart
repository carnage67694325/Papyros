import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bubble.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_states.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      buildWhen: (previous, current) {
        // Only rebuild when messages change or on specific states
        return current is ChatMessagesLoaded ||
            current is ChatError ||
            (current is ChatLoading &&
                BlocProvider.of<ChatCubit>(context).messagesList.isEmpty);
      },
      builder: (context, state) {
        // Always get the latest messages directly from the cubit
        final messagesList = BlocProvider.of<ChatCubit>(context).messagesList;

        // Handle error states
        if (state is ChatError) {
          log('Chat Error: ${state.errMessage}');

          // Show error message in a snackbar (don't do this in build method)
          // We handle this in the BlocConsumer in ChatViewBody instead

          // Still display messages if we have them
          if (messagesList.isNotEmpty) {
            return _buildMessageList(context, messagesList);
          }

          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16.sp)),
            ),
          );
        }

        // Show loading state only when no messages are available
        if (state is ChatLoading && messagesList.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: AppLoadingAnimation(size: 50.h),
            ),
          );
        }

        // If we have messages, show them regardless of state
        if (messagesList.isNotEmpty) {
          return _buildMessageList(context, messagesList);
        }

        // Different states with no messages
        if (state is ChatConnected) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('Connected. Waiting for messages...',
                  style: TextStyle(fontSize: 16.sp)),
            ),
          );
        }

        // Default initialization state
        return SliverToBoxAdapter(
          child: Center(
            child:
                Text('Initializing chat...', style: TextStyle(fontSize: 16.sp)),
          ),
        );
      },
    );
  }

  Widget _buildMessageList(BuildContext context, List<MessageEntity> messages) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final message = messages[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ChatBubble(
              key: ValueKey('chat_bubble_${message.from}_${index}'),
              message: message.content,
            ),
          );
        },
        childCount: messages.length,
      ),
    );
  }
}
