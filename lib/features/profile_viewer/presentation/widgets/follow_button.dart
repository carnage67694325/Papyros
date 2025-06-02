import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(45.w, 45.h),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.lightPeach,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Follow',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
