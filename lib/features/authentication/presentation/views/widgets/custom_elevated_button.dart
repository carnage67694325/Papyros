import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.buttonText,
    this.backgroundColor,
  });
  final void Function()? onPressed;
  final Widget? buttonText;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        backgroundColor: backgroundColor ?? AppColors.lightBrown,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      child: Center(child: buttonText),
    );
  }
}
