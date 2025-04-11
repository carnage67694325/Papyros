import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isFollowing;

  const ActionButton({
    super.key,
    required this.onPressed,
    required this.isFollowing,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: isFollowing ? Colors.black : Colors.white,
        backgroundColor: isFollowing ? Colors.white : AppColors.lightBrown,
        side: BorderSide(
          color: isFollowing ? Colors.grey.shade300 : AppColors.lightBrown,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        minimumSize: Size(80.w, 32.h),
      ),
      child: Text(
        isFollowing ? 'Following' : 'Follow',
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
