import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:shimmer/shimmer.dart';

class ContactListShimmer extends StatelessWidget {
  const ContactListShimmer({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(12.0.h),
          child: const ContactItemShimmer(),
        );
      },
    );
  }
}

class ContactItemShimmer extends StatelessWidget {
  const ContactItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: ThemeHelper.isDarkMode(context)
            ? AppColors.darkBackGroundColor
            : AppColors.backGroundColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: ThemeHelper.isDarkMode(context)
            ? Color(0xffFAEBD7)
            : Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar placeholder
            Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(width: 25.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 7.h),
                // Username placeholder
                Container(
                  height: 16.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(height: 10.h),
                // Last message placeholder
                Container(
                  height: 12.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Time placeholder
            Padding(
              padding: EdgeInsets.only(top: 10.0.h, right: 10.0.w),
              child: Container(
                height: 12.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
