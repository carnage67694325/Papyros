import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/features/chat_room/domain/entities/group_message_entity.dart';
import 'package:papyros/features/chat_room/presentation/manager/group_chat_cubit.dart';
import 'package:papyros/features/chat_room/presentation/manager/group_chat_states.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/chat_messaging_bubble.dart';

class GroupChatList extends StatelessWidget {
  const GroupChatList({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupChatCubit, GroupChatState>(
      builder: (context, state) {
        if (state is GroupMessagesLoading) {
          return SliverToBoxAdapter(
            child: Center(child: AppLoadingAnimation(size: 50.h)),
          );
        }

        if (state is GroupChatError) {
          log('Group Chat Error: ${state.errMessage}');
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  state.errMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16.sp),
                ),
              ),
            ),
          );
        }

        if (state is GroupMessagesLoaded) {
          final messages = state.messages;

          if (messages.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    'No messages yet. Start the conversation!',
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                ),
              ),
            );
          }

          return _buildMessageList(messages);
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }

  Widget _buildMessageList(List<GroupMessageEntity> messages) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final message = messages[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ChatMessagingBubble(
              key: ValueKey('group_msg_${message.senderId}_$index'),
              message: message.message,
              isSender: message.senderId == userId,
            ),
          );
        },
        childCount: messages.length,
      ),
    );
  }
}
