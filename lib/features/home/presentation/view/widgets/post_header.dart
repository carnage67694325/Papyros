// File: post/presentation/widgets/post_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_tag.dart';
import 'package:papyros/features/home/presentation/view/widgets/time_formarter.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';

class PostHeader extends StatelessWidget {
  final String userName;
  final String userProfileImageUrl;
  final String createdAtString;
  final String? tag;

  const PostHeader({
    super.key,
    required this.userName,
    required this.userProfileImageUrl,
    required this.createdAtString,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserProfileHomeAvatar(
          userProfileImage: userProfileImageUrl,
          height: 60.h,
          width: 60.w,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: AppStyles.chatHeader.copyWith(fontSize: 18),
              ),
              SizedBox(height: 4.h),
              Text(
                TimeFormatter.timeAgo(createdAtString),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        if (tag != null) PostTag(tag: tag!),
      ],
    );
  }
}
