// File: post/presentation/widgets/comment_item.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/features/home/presentation/view/widgets/comment_action.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_app_bar.dart';
import 'package:papyros/features/home/presentation/view/widgets/time_formarter.dart';

class CommentItem extends StatelessWidget {
  final String userName;
  final String comment;
  final String timeAgo;
  final String avatarUrl;

  const CommentItem({
    super.key,
    required this.userName,
    required this.comment,
    required this.timeAgo,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: CachedNetworkImageProvider(avatarUrl),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      TimeFormatter.timeAgo(timeAgo),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                SelectionContainer.disabled(
                  child: Text(
                    comment,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                SizedBox(height: 4.h),
                const CommentActions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
