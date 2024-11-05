import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/animations/transition_animation.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/authentication/presentation/views/getting_started_view.dart';
import 'package:papyros/features/authentication/sign_In/presentation/view/sign_in_view.dart';
import 'package:papyros/features/authentication/sign_up/presentation/view/sign_up_view.dart';
import 'package:papyros/features/authentication/sign_up/data/data_sources/SignuoDaoimp/signup_api_Imp.dart';
import 'package:papyros/features/authentication/sign_up/data/repositories/signup_Imp.dart';
import 'package:papyros/features/authentication/sign_up/domain/use_cases/signup_use_case.dart';
import 'package:papyros/features/authentication/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:papyros/features/authentication/verfiy_otp/presentation/view/verfiy_otp.dart';
import 'package:papyros/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kGettingStarted = '/gettingStarted';
  static const kSignIn = "/signIn";
  static const kSignUp = '/signUp';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const VerfiyOtp(),
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
    GoRoute(
      path: kSignUp,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: BlocProvider(
              create: (context) => SignupCubit(SignUpUseCase(
                  SignupRepoImp(SignupApiImp(ApiService(Dio()))))),
              child: const SignupView(),
            ));
      },
    ),
  ]);
}
