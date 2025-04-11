// File: post/presentation/widgets/comment_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/home/presentation/view/widgets/comment_item.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Comments',
                style: AppStyles.chatHeader.copyWith(fontSize: 18),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: AppColors.backGroundColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        // Example comments - in real app, these would come from a data source
        const CommentItem(
          userName: 'User One',
          comment: 'Really interesting post!',
          timeAgo: '1h ago',
          avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        ),
        const CommentItem(
          userName: 'User Two',
          comment: 'Nice info!',
          timeAgo: '30m ago',
          avatarUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
        ),
      ],
    );
  }
}
