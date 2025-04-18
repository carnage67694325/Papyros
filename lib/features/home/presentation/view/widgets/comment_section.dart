import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/home/data/models/comments.dart';
import 'package:papyros/features/home/presentation/view/widgets/add_comment_field.dart';
import 'package:papyros/features/home/presentation/view/widgets/comment_item.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
    required this.comments,
    required this.userProfileImageUrl,
  });

  final List<CommentModel> comments;
  final String userProfileImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
              if (comments.isNotEmpty)
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

        // Only show comments list if there are comments
        if (comments.isNotEmpty)
          SizedBox(
            height: comments.length > 2 ? 300.h : comments.length * 200.h,
            child: ListView.builder(
              itemCount: comments.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CommentItem(
                  userName: "userName",
                  comment: comments[index].description,
                  timeAgo: comments[index].createdAt,
                  avatarUrl: "avatarUrl",
                );
              },
            ),
          ),

        // Always show the add comment field
        AddCommentField(userProfileImageUrl: userProfileImageUrl),
      ],
    );
  }
}
