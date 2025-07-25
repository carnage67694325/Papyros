import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

void successSnackBar(BuildContext context, String errMessage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    clipBehavior: Clip.hardEdge,
    content: Text(
      errMessage,
      // ignore: prefer_const_constructors
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: AppColors.lightPeach,
    duration: const Duration(seconds: 3),
    animation: CurvedAnimation(
      parent: AnimationController(
        vsync: ScaffoldMessenger.of(context),
        duration: const Duration(milliseconds: 300),
      ),
      curve: Curves.bounceIn, // Controls how long the SnackBar is visible
    ),
  ));
}
