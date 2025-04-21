import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_avatar.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    super.key,
    required this.userImage,
    required this.userName,
  });

  final String userImage;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContactAvatar(avatarSize: 20, userImage: userImage),
        SizedBox(
          width: 8.w,
        ),
        Text(
          userName,
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
