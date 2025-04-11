// File: post/presentation/widgets/comment_actions.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentActions extends StatelessWidget {
  const CommentActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.favorite_border, size: 16.sp, color: Colors.grey),
        SizedBox(width: 4.w),
        Text('Like', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
        SizedBox(width: 16.w),
        Icon(Icons.reply, size: 16.sp, color: Colors.grey),
        SizedBox(width: 4.w),
        Text('Reply', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
      ],
    );
  }
}
