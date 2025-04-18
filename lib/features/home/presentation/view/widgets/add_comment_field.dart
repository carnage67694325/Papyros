// File: post/presentation/widgets/add_comment_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';

class AddCommentField extends StatelessWidget {
  final String userProfileImageUrl;
  final TextEditingController commentController;
  final void Function() onPressed;
  const AddCommentField({
    super.key,
    required this.userProfileImageUrl,
    required this.commentController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          UserProfileHomeAvatar(
            userProfileImage: userProfileImageUrl,
            height: 40.h,
            width: 40.w,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  hintText: 'Add a comment...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: AppColors.lightBrown),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
