import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/animations/transition_animation.dart';
import 'package:papyros/core/utils/functions/service_locator.dart';
import 'package:papyros/features/authentication/presentation/views/getting_started_view.dart';
import 'package:papyros/features/authentication/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:papyros/features/authentication/sign_in/presentation/views/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:papyros/features/authentication/sign_in/presentation/views/sign_in_view.dart';
import 'package:papyros/features/authentication/sign_up/domain/use_cases/sign_up_usecase.dart';
import 'package:papyros/features/authentication/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:papyros/features/authentication/sign_up/presentation/views/sign_up_view.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/use_cases/verfiy_otp_use_case.dart';
import 'package:papyros/features/authentication/verfiy_otp/presentation/manager/verfiy_otp_cubit/verfiy_otp_cubit.dart';
import 'package:papyros/features/authentication/verfiy_otp/presentation/view/verfiy_otp_view.dart';
import 'package:papyros/features/profile_management/presentation/view/profile_management_view.dart';

abstract class AppRouter {
  static const kGettingStarted = '/gettingStarted';
  static const kSignIn = "/signIn";
  static const kSignUp = '/signUp';
  static const kVerfiyOtp = '/verfiyOtp';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProfileManagementView(),
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
    GoRoute(
      path: kSignUp,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: BlocProvider(
              create: (context) => SignUpCubit(getIt.get<SignUpUsecase>()),
              child: const SignupView(),
            ));
      },
    ),
    GoRoute(
      path: kVerfiyOtp,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: BlocProvider(
              create: (context) =>
                  VerfiyOtpCubit(getIt.get<VerfiyOtpUseCase>()),
              child: const VerfiyOtpView(),
            ));
      },
    ),
  ]);
}
