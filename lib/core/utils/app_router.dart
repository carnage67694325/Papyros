import 'package:dio/dio.dart';
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
import 'package:papyros/features/chat_bot/domain/use_cases/chat_bot_send_prompt_UseCase.dart';
import 'package:papyros/features/chat_bot/presentation/manager/cubit/send_prompt_cubit.dart';
import 'package:papyros/features/chat_bot/presentation/view/chat_bot_view.dart';
import 'package:papyros/features/home/presentation/view/add_post_view.dart';
import 'package:papyros/features/messaging/presentation/view/messaging_view.dart';
import 'package:papyros/features/navigation/presentation/view/navigation.dart';
import 'package:papyros/features/profile_management/data/repositories/profile_managment_repo_imp.dart';
import 'package:papyros/features/profile_management/domain/use_cases/get_user_use_case.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:papyros/features/profile_management/presentation/manager/update_profile_image_cubit/update_profile_image_cubit.dart';
import 'package:papyros/features/profile_management/presentation/view/profile_management_view.dart';
import 'package:papyros/features/profile_viewer/data/data_source/follow_datasource_impl.dart';
import 'package:papyros/features/profile_viewer/data/data_source/profile_viewer_data_source_impl.dart';
import 'package:papyros/features/profile_viewer/data/repos/follow_repo_impl.dart';
import 'package:papyros/features/profile_viewer/data/repos/profile_viewer_repo_impl.dart';
import 'package:papyros/features/profile_viewer/domain/usecase/follow_usecase.dart';
import 'package:papyros/features/profile_viewer/domain/usecase/profile_view_usecase.dart';
import 'package:papyros/features/profile_viewer/presentation/manager/follow_cubit/follow_cubit.dart';
import 'package:papyros/features/profile_viewer/presentation/manager/profile_view_cubit/profile_view_cubit.dart';
import 'package:papyros/features/profile_viewer/presentation/profile_viewer.dart';
import 'package:papyros/features/setting/language_display.dart';
import 'package:papyros/features/setting/setting.dart';
import 'package:papyros/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kGettingStarted = '/gettingStarted';
  static const kSignIn = "/signIn";
  static const kSignUp = '/signUp';
  static const kVerfiyOtp = '/verfiyOtp';
  static const kProfileManage = '/profileManage';
  static const kChatBot = '/chatBot';
  static const kAddPost = '/addPost';
  static const kNavigation = '/navigation';
  static const kMessaging = '/messaging';
  static const kSettings = '/settings';
  static const kLanguage = '/language';
  static const kProfileViewer = '/profileViewer';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    /*GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),*/
    GoRoute(
      path: kSettings,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: const SettingsScreen());
      },
    ),
    GoRoute(
      path: kLanguage,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: const LanguageDisplay());
      },
    ),
    GoRoute(
      path: kGettingStarted,
      pageBuilder: (context, state) {
        return TransitionAnimation.circularTransitionAnimation(state,
            route: const GettingStartedView());
      },
    ),
    GoRoute(
      path: kNavigation,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: const Navigation());
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
    GoRoute(
      path: kProfileManage,
      pageBuilder: (context, state) {
        return TransitionAnimation.slidingTransitionAnimations(state,
            route: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      GetUserProfileCubit(getIt.get<GetUserProfileUseCase>()),
                ),
                BlocProvider(create: (context) => UpdateProfileImageCubit()),
              ],
              child: const ProfileManagementView(),
            ));
      },
    ),
    GoRoute(
        path: kChatBot,
        pageBuilder: (context, state) {
          return TransitionAnimation.slidingTransitionAnimations(state,
              route: BlocProvider(
                create: (context) =>
                    SendPromptCubit(getIt.get<ChatBotSendPromptUseCase>()),
                child: const ChatBotView(),
              ));
        }),
    GoRoute(
        path: kAddPost,
        pageBuilder: (context, state) {
          return TransitionAnimation.slidingTransitionAnimations(
            state,
            route: const AddPostView(),
          );
        }),
    GoRoute(
        path: kMessaging,
        pageBuilder: (context, state) {
          return TransitionAnimation.slidingTransitionAnimations(
            state,
            route: const MessagingView(),
          );
        }),
    GoRoute(
        path: kProfileViewer,
        pageBuilder: (context, state) {
          final userId = state.extra as String;
          return TransitionAnimation.slidingTransitionAnimations(
            state,
            route: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ProfileViewCubit(ProfileViewUsecase(
                      ProfileViewerRepoImpl(
                          remoteDataSource:
                              ProfileViewerDataSourceImpl(dio: Dio())))),
                ),
                BlocProvider(
                  create: (context) => FollowCubit(FollowUsecase(FollowRepoImpl(
                      followDatascoure: FollowDatasourceImpl(dio: Dio())))),
                ),
              ],
              child: ProfileViewer(
                userId: userId,
              ),
            ),
          );
        }),
  ]);
}
