import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/features/splash/presentation/view/widget/animated_logo.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initiSlidingAnimation();
    transitionToGetStarted();

    PrefasHandelr().checkAuthToken(context);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.buildLinearGradient(),
        ),
        child: SlidingAnimatedLogo(
            animationController: animationController,
            slidingAnimation: slidingAnimation),
      ),
    );
  }

  void initiSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, .25), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void transitionToGetStarted() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      GoRouter.of(context).push(AppRouter.kGettingStarted);
    });
  }
}
