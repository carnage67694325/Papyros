import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:papyros/core/utils/app_colors.dart';

class PostCardShimmer extends StatelessWidget {
  const PostCardShimmer({super.key, this.hasImage = true});

  final bool hasImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeHelper.isDarkMode(context)
            ? AppColors.darkBackGroundColor
            : AppColors.backGroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: ThemeHelper.isDarkMode(context)
            ? Color(0xffFAEBD7)
            : Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Row: User Profile + Name (Shimmer)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  // Avatar placeholder
                  Container(
                    height: 55.h,
                    width: 55.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        // Username placeholder
                        Container(
                          height: 16.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        if (!hasImage)
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Content placeholder lines
                                for (int i = 0; i < 3; i++)
                                  Padding(
                                    padding: EdgeInsets.only(top: 6.h),
                                    child: Container(
                                      height: 14.h,
                                      width: 250.w - (i * 30.w),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      // More options icon placeholder
                      Container(
                        height: 24.h,
                        width: 24.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ],
              ),
            ),

            /// Description above image if image exists
            if (hasImage)
              Padding(
                padding: EdgeInsets.only(left: 65.0.h, right: 32.h, top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Content placeholder lines
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: EdgeInsets.only(top: 6.h),
                        child: Container(
                          height: 14.h,
                          width: 250.w - (i * 30.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

            /// Image placeholder
            if (hasImage)
              Padding(
                padding: EdgeInsets.only(
                    left: 65.0.h, right: 32.h, top: 8.h, bottom: 6.h),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

            /// Interact Section placeholder
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  5,
                  (index) => Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
