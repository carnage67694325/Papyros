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
      buildWhen: (previous, current) {
        return current is GroupMessagesLoaded ||
            current is GroupChatError ||
            (current is GroupChatLoading &&
                BlocProvider.of<GroupChatCubit>(context)
                    .groupMessagesList
                    .isEmpty);
      },
      builder: (context, state) {
        final messagesList =
            BlocProvider.of<GroupChatCubit>(context).groupMessagesList;

        if (state is GroupChatError) {
          log('Group Chat Error: ${state.errMessage}');

          if (messagesList.isNotEmpty) {
            return _buildMessageList(messagesList);
          }

          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errMessage,
                style: TextStyle(color: Colors.red, fontSize: 16.sp),
              ),
            ),
          );
        }

        if (state is GroupChatLoading && messagesList.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: AppLoadingAnimation(size: 50.h),
            ),
          );
        }

        if (messagesList.isNotEmpty) {
          return _buildMessageList(messagesList);
        }

        if (state is GroupChatConnected) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('Connected. Waiting for group messages...',
                  style: TextStyle(fontSize: 16.sp)),
            ),
          );
        }

        return SliverToBoxAdapter(
          child: Center(
            child: Text('Start the group conversation!',
                style: TextStyle(fontSize: 16.sp)),
          ),
        );
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
