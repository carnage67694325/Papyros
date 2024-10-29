import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onTap,
    required this.buttonText,
    this.fontSize,
    this.fontColor,
  });
  final void Function()? onTap;
  final String buttonText;
  final double? fontSize;
  final Color? fontColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        buttonText,
        style: AppStyles.subHeader.copyWith(
          color: fontColor ?? AppColors.lightBrown,
          fontSize: fontSize ?? 16,
        ),
      ),
    );
  }
}
