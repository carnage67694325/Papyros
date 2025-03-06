import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xFFE8E8E8),
      height: 30.h,
      indent: 45.w,
      endIndent: 45.w,
    );
  }
}
