import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bubble.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_states.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatError) {
          log(state.errMessage);
        } else if (state is ChatMessagesLoaded) {
          log('Messages loaded: ${state.messages.length}');
        }
      },
      builder: (context, state) {
        if (state is ChatMessagesLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: ChatBubble(message: state.messages[index].content),
              ),
              childCount: state.messages.length,
            ),
          );
        } else if (state is MessageLoading) {
          return SliverToBoxAdapter(
            child: Center(
              child: AppLoadingAnimation(
                size: 50.h,
              ),
            ),
          );
        } else if (state is ChatError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('No messages yet.'),
            ),
          );
        }
      },
    );
  }
}
