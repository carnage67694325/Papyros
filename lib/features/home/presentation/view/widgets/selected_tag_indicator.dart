import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';

class SelectedTagIndicator extends StatelessWidget {
  final String tagName;

  const SelectedTagIndicator({Key? key, required this.tagName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightPeach.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          'Selected: $tagName',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.lightBrown,
          ),
        ),
      ),
    );
  }
}
