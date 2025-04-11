import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/assets.dart';

class UserNameAndProfileCircle extends StatelessWidget {
  const UserNameAndProfileCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.assetsPoflieCricle),
        SizedBox(width: 10.w),
        Text(
          'User Name',
          style: AppStyles.chatHeader
              .copyWith(fontSize: 15.sp, color: Colors.black),
        ),
        SizedBox(
          height: 19.h,
        )
      ],
    );
  }
}
