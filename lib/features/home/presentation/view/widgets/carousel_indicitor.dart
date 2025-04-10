// 6. Carousel Indicator
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';

class CarouselIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const CarouselIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: 8.h,
          width: index == currentIndex ? 20.w : 8.w,
          decoration: BoxDecoration(
            color:
                index == currentIndex ? AppColors.lightBrown : Colors.grey[300],
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    );
  }
}
