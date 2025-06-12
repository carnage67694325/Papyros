import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_avatar.dart';

class GroupChatAppBar extends StatelessWidget {
  const GroupChatAppBar({
    super.key,
    required this.groupImage,
    required this.groupName,
  });

  final String groupImage;
  final String groupName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContactAvatar(avatarSize: 20, userImage: groupImage),
        SizedBox(
          width: 8.w,
        ),
        Text(
          groupName,
          style: GoogleFonts.oleoScript(
              fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
