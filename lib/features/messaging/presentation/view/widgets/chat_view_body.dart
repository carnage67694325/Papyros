import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bubble.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/chat_list.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_avatar.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/message_input_field.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody(
      {super.key, required this.userName, required this.userImage});

  final String userName;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main scrollable content
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(bottom: 20.h),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.grey[750],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ContactAvatar(avatarSize: 90.h, userImage: userImage),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        userName,
                        style: GoogleFonts.oleoScript(
                            fontSize: 26.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Location",
                        style: GoogleFonts.oleoScript(
                            fontSize: 18.sp,
                            color: Colors.grey[750],
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "jan 26, 2025",
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: const Color(0xff89868C)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
              // Chat list remains in the scrollable area
              const ChatList(),
              // Add some padding at the bottom so the last message isn't hidden behind input field
              SliverToBoxAdapter(
                child: SizedBox(height: 16.h),
              ),
            ],
          ),
        ),

        // Message input field is fixed at the bottom outside the scroll view
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
          child: const MessageInputField(
            sendButtonColor: AppColors.lightPeach,
          ),
        ),
      ],
    );
  }
}
