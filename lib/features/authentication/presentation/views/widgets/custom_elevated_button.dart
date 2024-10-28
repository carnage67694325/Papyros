import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.buttonText,
  });
  final void Function()? onPressed;
  final Widget? buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: AppColors.mediumBrown,
      ),
      child: buttonText,
    );
  }
}
