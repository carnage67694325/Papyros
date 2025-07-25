import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/home/presentation/view/widgets/mention_searchfield.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_button.dart';

class PostActionBar extends StatelessWidget {
  final bool isSubmitting;
  final bool canSubmit;
  final VoidCallback onSubmit;
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;
  final TextEditingController postController;
  const PostActionBar({
    super.key,
    required this.isSubmitting,
    required this.canSubmit,
    required this.onSubmit,
    required this.onCameraTap,
    required this.onGalleryTap,
    required this.postController,
  });

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
          SizedBox(width: 16.w),
          IconButton(
            icon: Icon(
              Icons.alternate_email,
              color: AppColors.lightPeach,
              size: 34.sp,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    insetPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      child: MentionSearchField(
                        postController: postController,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(width: 90.w),
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
