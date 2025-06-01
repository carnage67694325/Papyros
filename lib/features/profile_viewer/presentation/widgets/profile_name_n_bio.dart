import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_styles.dart';

class ProfileNameNBio extends StatelessWidget {
  const ProfileNameNBio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            "User Name",
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
              "blah blah blah blah blah blah blah blah",
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

class ProfileNameNBio extends StatelessWidget {
  const ProfileNameNBio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            "User Name",
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
              "blah blah blah blah blah blah blah blah",
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
