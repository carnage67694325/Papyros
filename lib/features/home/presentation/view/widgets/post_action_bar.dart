import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/home/presentation/view/widgets/add_post_view_body.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_button.dart';

class PostActionBar extends StatelessWidget {
  final bool isSubmitting;
  final bool canSubmit;
  final VoidCallback onSubmit;
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  const PostActionBar({
    Key? key,
    required this.isSubmitting,
    required this.canSubmit,
    required this.onSubmit,
    required this.onCameraTap,
    required this.onGalleryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.photo_camera_outlined,
              color: AppColors.lightPeach,
              size: 34.sp,
            ),
            onPressed: isSubmitting ? null : onCameraTap,
          ),
          SizedBox(width: 16.w),
          IconButton(
            icon: Icon(
              Icons.add,
              color: AppColors.lightPeach,
              size: 34.sp,
            ),
            onPressed: isSubmitting ? null : onGalleryTap,
          ),
          SizedBox(width: 155.w),
          PostButton(
            isSubmitting: isSubmitting,
            canSubmit: canSubmit,
            onSubmit: onSubmit,
          ),
        ],
      ),
    );
  }
}
