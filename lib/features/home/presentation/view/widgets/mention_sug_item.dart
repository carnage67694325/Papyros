import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:papyros/core/utils/golabls/mentionId.dart';

class MentionSugItem extends StatelessWidget {
  final String name;
  final String profileImage;
  final String userId;
  final VoidCallback? onTap;
  final void Function(String userName)? onMentionSelected;

  const MentionSugItem({
    super.key,
    required this.name,
    required this.profileImage,
    required this.userId,
    this.onTap,
    this.onMentionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        mentIonId = userId;
        mentIonUserName = name;

        // Optional callback to insert the mention text
        if (onMentionSelected != null) {
          onMentionSelected!(name);
        }

        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(profileImage),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 22.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
