import 'package:go_router/go_router.dart';
import 'package:papyros/core/animations/transition_animation.dart';
import 'package:papyros/features/authentication/presentation/views/sign_in_view.dart';
import 'package:papyros/features/authentication/presentation/views/sign_up_view.dart';
import 'package:papyros/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kSignIn = "/signIn";
  static const kSignUp = '/signUp';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kSignUp,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: const Signup());
      },
    ),
    GoRoute(
      path: kSignIn,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: const SignIn());
      },
    )
  ]);
}
