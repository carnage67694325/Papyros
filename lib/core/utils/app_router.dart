import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/animations/transition_animation.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/authentication/presentation/views/getting_started_view.dart';
import 'package:papyros/features/authentication/sign%20_in/presentation/views/sign_in_view.dart';
import 'package:papyros/features/authentication/presentation/views/sign_up_view.dart';
import 'package:papyros/features/authentication/verfiy_otp/data/repos/verfiy_otp_imp.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/repos/verfiy_otp_repo.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/use_cases/verfiy_otp_use_case.dart';
import 'package:papyros/features/authentication/verfiy_otp/presentation/manager/verfiy_otp_cubit/verfiy_otp_cubit.dart';
import 'package:papyros/features/authentication/verfiy_otp/presentation/view/verfiy_otp_view.dart';
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
            route: const SignInView());
      },
    ),
    // GoRoute(
    //   path: kSignUp,
    //   pageBuilder: (context, state) {
    //     return TransitionAnimation.slidingTransitionAnimations(state,
    //         route: const SignupView());
    //   },
    // ),
    GoRoute(
      path: kSignUp,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: BlocProvider(
              create: (context) => VerfiyOtpCubit(
                  VerfiyOtpUseCase(VerfiyOtpRepoImp(ApiService(Dio())))),
              child: const VerfiyOtpView(),
            ));
      },
    ),
  ]);
}
