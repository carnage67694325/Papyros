import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_states.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/chat_list.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_avatar.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/message_input_field.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({
    super.key,
    required this.userName,
    required this.userImage,
    required this.toUserId,
    required this.token,
    required this.userId,
  });

  final String userName;
  final String userImage;
  final String toUserId;
  final String token;
  final String userId;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  late TextEditingController _messageController;
  final ScrollController _scrollController = ScrollController();
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();

    // Initialize connection after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initChat();
    });
  }

  void _initChat() async {
    final cubit = BlocProvider.of<ChatCubit>(context);

    // First connect to socket if needed
    if (cubit.state is ChatInitial) {
      await cubit.connectToSocket(widget.token, widget.toUserId);
    }

    // Then get messages
    await cubit.getMessages(
      token: widget.token,
      toUserId: widget.toUserId,
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
      // Use a smaller delay to avoid visible lag but still ensure messages are rendered
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

    // Clear input field immediately after initiating send
    _messageController.clear();

    try {
      // Send the message
      await BlocProvider.of<ChatCubit>(context).sendMessage(
        token: widget.token,
        toUserId: widget.toUserId,
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
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is MessageSent || state is ChatMessagesLoaded) {
          // Scroll to bottom when a message is sent or new messages are loaded
          _scrollToBottom();
        } else if (state is ChatError) {
          // Handle error state
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        // Determine if the input should be disabled
        bool inputEnabled = !(state is MessageLoading || _isSending);

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
                              avatarSize: 90.h, userImage: widget.userImage),
                          SizedBox(height: 20.h),
                          Text(
                            widget.userName,
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
                  // Using the improved ChatList widget without the problematic key
                  ChatList(
                    userId: widget.userId,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                ],
              ),
            ),

            // Input field and send button
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
