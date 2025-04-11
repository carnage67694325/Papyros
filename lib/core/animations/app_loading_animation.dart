import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:papyros/core/utils/app_colors.dart';

class AppLoadingAnimation extends StatelessWidget {
  const AppLoadingAnimation({
    super.key,
    this.size,
  });
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: LoadingAnimationWidget.flickr(
              leftDotColor: AppColors.darkBrown,
              rightDotColor: AppColors.lightPeach,
              size: size ?? 35),
        ),
      ],
    );
  }
}
