import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/comments/data/models/Addcommentmodel.dart';
import 'package:papyros/features/home/presentation/view/widgets/comment_item.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({super.key, required this.comments});
  final List<CommentModel> comments;
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
        SizedBox(
          height: 400
              .h, // Specify a fixed height or use MediaQuery for responsive height
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return CommentItem(
                userName: "userName",
                comment: comments[index].description,
                timeAgo: comments[index].createdAt,
                avatarUrl: "avatarUrl",
              );
            },
          ),
        )
      ],
    );
  }
}
