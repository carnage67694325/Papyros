import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/chat_room/presentation/manager/group_chat_cubit.dart';
import 'package:papyros/features/chat_room/presentation/manager/group_chat_states.dart';
import 'package:papyros/features/chat_room/presentation/view/widgets/group_chat_list.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/chat_list.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_avatar.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/message_input_field.dart';

class GroupChatViewBody extends StatefulWidget {
  const GroupChatViewBody({
    super.key,
    required this.groupName,
    required this.groupImage,
    required this.groupId,
    required this.token,
    required this.userId,
  });

  final String groupName;
  final String groupImage;
  final String groupId;
  final String token;
  final String userId;

  @override
  State<GroupChatViewBody> createState() => _GroupChatViewBodyState();
}

class _GroupChatViewBodyState extends State<GroupChatViewBody> {
  late TextEditingController _messageController;
  final ScrollController _scrollController = ScrollController();
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initGroupChat();
    });
  }

  void _initGroupChat() async {
    final cubit = BlocProvider.of<GroupChatCubit>(context);

    if (cubit.state is GroupChatInitial) {
      await cubit.connectToSocket(widget.token, widget.userId);
    }

    await cubit.getGroupMessages(
      token: widget.token,
      groupId: widget.groupId,
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 50), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  void _handleSendMessage() async {
    final messageText = _messageController.text.trim();
    if (messageText.isEmpty || _isSending) return;

    setState(() {
      _isSending = true;
    });

    _messageController.clear();

    try {
      await BlocProvider.of<GroupChatCubit>(context).sendGroupMessage(
        token: widget.token,
        groupId: widget.groupId,
        message: messageText,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupChatCubit, GroupChatState>(
      listener: (context, state) {
        if (state is GroupMessageSent || state is GroupMessagesLoaded) {
          _scrollToBottom();
        } else if (state is GroupChatError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        final inputEnabled = !(state is GroupMessagesLoading || _isSending);

        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Divider(color: Colors.grey[750]),
                          SizedBox(height: 20.h),
                          ContactAvatar(
                              avatarSize: 90.h, userImage: widget.groupImage),
                          SizedBox(height: 20.h),
                          Text(
                            widget.groupName,
                            style: GoogleFonts.oleoScript(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                        ],
                      ),
                    ),
                  ),
                  GroupChatList(userId: widget.userId),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                ],
              ),
            ),
            Container(
              height: 85.h,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -1),
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  MessageInputField(
                    controller: _messageController,
                    onSendPressed: _handleSendMessage,
                    sendButtonColor: AppColors.lightPeach,
                    isEnabled: inputEnabled,
                  ),
                  if (_isSending)
                    Positioned(
                      right: 25,
                      child: SizedBox(
                        width: 20.h,
                        height: 20.h,
                        child: const AppLoadingAnimation(),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
