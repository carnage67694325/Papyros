import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bubble.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/chat_list.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_avatar.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody(
      {super.key, required this.userName, required this.userImage});
  final String userName;
  final String userImage;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        const ChatList(),
      ],
    );
  }
}
