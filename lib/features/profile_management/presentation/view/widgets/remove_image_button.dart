import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/assets.dart';

class RemoveImageButton extends StatelessWidget {
  const RemoveImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: Colors.grey[800]!.withOpacity(0.68), // Dark grey color
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: SvgPicture.asset(Assets.assetsIconsCloseSM),
        ),
      ),
    );
  }
}
