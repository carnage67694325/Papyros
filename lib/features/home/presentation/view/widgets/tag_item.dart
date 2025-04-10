import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';

class TagItem extends StatelessWidget {
  final String tag;
  final bool isSelected;
  final VoidCallback onTap;

  const TagItem({
    Key? key,
    required this.tag,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.lightBrown : Colors.grey[200],
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          elevation: isSelected ? 4 : 0,
          minimumSize: Size(110.w, 40.h),
        ),
        child: Text(
          tag,
          style: AppStyles.chatHeader.copyWith(
            fontSize: 14.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
