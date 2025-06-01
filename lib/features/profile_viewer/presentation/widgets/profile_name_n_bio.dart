import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_styles.dart';

class ProfileNameNBio extends StatelessWidget {
  const ProfileNameNBio({
    super.key,
    required this.name,
    required this.bio,
  });
  final String name;
  final String bio;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            name,
            style: AppStyles.subHeader.copyWith(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 300.w,
            child: Text(
              textAlign: TextAlign.start,
              bio,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.subHeader.copyWith(
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
