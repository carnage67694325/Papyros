import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/generated/l10n.dart';

class SlidingAnimatedLogo extends StatelessWidget {
  const SlidingAnimatedLogo({
    super.key,
    required this.animationController,
    required this.slidingAnimation,
  });

  final AnimationController animationController;
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  S.of(context).logo,
                  textAlign: TextAlign.center,
                  style: AppStyles.logo,
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
          );
        });
  }
}
