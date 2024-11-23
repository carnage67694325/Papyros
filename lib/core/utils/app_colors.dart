import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryBlue = Color(0xFF6482AD);
  static const Color lightBlue = Color(0xFF7FA1C3);
  static const Color lightGreyBlue = Color(0xFFE2DAD6);
  static const Color darkBrown = Color(0xFF584242);
  static const Color lightPeach = Color(0xFFE6B9A6);
  static const Color lightBrown = Color(0xFFC19C8D);
  static const Color mediumBrown = Color(0xFF896252);
  static const Color lightYellow = Color(0xFFF6EFBD);
  static const Color textFieldFillColor = Color(0xFFE8E8E8);
  static const Color backGroundColor = Color(0xffF9F6F6);
  static const Color iconColor = Color(0xff8A878C);

  static LinearGradient buildLinearGradient() {
    return const LinearGradient(
        colors: [AppColors.lightPeach, AppColors.mediumBrown],
        begin: AlignmentDirectional.topStart,
        end: Alignment.bottomCenter);
  }
}
