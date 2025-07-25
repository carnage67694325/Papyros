// File: post/presentation/widgets/post_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_tag.dart';
import 'package:papyros/features/home/presentation/view/widgets/time_formarter.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';

class PostHeader extends StatelessWidget {
  final String userName;
  final String userProfileImageUrl;
  final String createdAtString;
  final String? tag;
  final String userId;
  const PostHeader({
    super.key,
    required this.userName,
    required this.userProfileImageUrl,
    required this.createdAtString,
    this.tag,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kProfileViewer, extra: userId);
          },
          child: UserProfileHomeAvatar(
            userProfileImage: userProfileImageUrl,
            height: 60.h,
            width: 60.w,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,
                  style: AppStyles.chatHeader.copyWith(
                    fontSize: 18,
                    color: ThemeHelper.isDarkMode(context)
                        ? Colors.white
                        : Colors.black.withValues(
                            alpha: 0.75,
                          ),
                  )),
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
