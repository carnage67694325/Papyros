import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
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
  });

  final String userName;
  final String userImage;
  final String toUserId;
  final String token;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _handleSendMessage() {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      BlocProvider.of<ChatCubit>(context).sendMessage(
        widget.toUserId,
        messageText,
        widget.token,
      );
      _messageController.clear(); // Clear the input field after sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is MessageSent) {
          successSnackBar(
            context,
            "Message sent successfully",
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
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
                          Text(
                            "Location",
                            style: GoogleFonts.oleoScript(
                              fontSize: 18.sp,
                              color: Colors.grey[750],
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Jan 26, 2025",
                            style: GoogleFonts.inter(
                              fontSize: 15.sp,
                              color: const Color(0xff89868C),
                            ),
                          ),
                          SizedBox(height: 5.h),
                        ],
                      ),
                    ),
                  ),
                  const ChatList(),
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
              child: MessageInputField(
                controller: _messageController,
                onSendPressed: _handleSendMessage,
                sendButtonColor: AppColors.lightPeach,
              ),
            ),
          ],
        );
      },
    );
  }
}
