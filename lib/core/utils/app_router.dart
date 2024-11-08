import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/animations/transition_animation.dart';
import 'package:papyros/core/utils/functions/service_locator.dart';
import 'package:papyros/features/authentication/presentation/views/getting_started_view.dart';
import 'package:papyros/features/authentication/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:papyros/features/authentication/sign_in/presentation/views/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:papyros/features/authentication/sign_in/presentation/views/sign_in_view.dart';

import 'package:papyros/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kGettingStarted = '/gettingStarted';
  static const kSignIn = "/signIn";
  static const kSignUp = '/signUp';
  static const kVerfiyOtp = '/verfiyOtp';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kGettingStarted,
      pageBuilder: (context, state) {
        return TransitionAnimation.circularTransitionAnimation(state,
            route: const GettingStartedView());
      },
    ),
    GoRoute(
      path: kSignIn,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: BlocProvider(
              create: (context) => SignInCubit(getIt.get<SignInUseCase>()),
              child: const SignInView(),
            ));
      },
    ),
    // GoRoute(
    //   path: kSignUp,
    //   pageBuilder: (context, state) {
    //     return TransitionAnimation.slidingTransitionAnimations(state,
    //         route: const SignupView());
    //   },
    // // ),
    // GoRoute(
    //   path: kSignUp,
    //   pageBuilder: (context, state) {
    //     return TransitionAnimation.slidingTransitionAnimations(state,
    //         route: BlocProvider(
    //           create: (context) => VerfiyOtpCubit(
    //               VerfiyOtpUseCase(VerfiyOtpRepoImp(ApiService(Dio())))),
    //           child: const VerfiyOtpView(),
    //         ));
    //   },
    // ),
  ]);
}
