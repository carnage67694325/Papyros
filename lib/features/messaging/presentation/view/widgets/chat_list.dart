import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/features/messaging/domain/entites/message_entity.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_states.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/chat_messaging_bubble.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.userId});
  final String userId;

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
            child: Text('Start your conversation!',
                style: TextStyle(fontSize: 16.sp)),
          ),
        );
      },
    );
  }

  Widget _buildMessageList(BuildContext context, List<MessageEntity> messages) {
    // Create a new list to avoid modifying the original
    final displayMessages = List<MessageEntity>.from(messages);

    // Use displayMessages.reversed.toList() if you want messages in reverse chronological order
    // This would show newest messages at the bottom
    // final displayMessages = messages.reversed.toList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final message = displayMessages[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ChatMessagingBubble(
              key: ValueKey('chat_bubble_${message.from}_$index'),
              message: message.content,
              isSender: message.from == userId,
            ),
          );
        },
        childCount: displayMessages.length,
      ),
    );
  }
}
