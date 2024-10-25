import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_styles.dart';

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
                  'Papyros',
                  textAlign: TextAlign.center,
                  style: AppStyles.logo,
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          );
        });
  }
}
