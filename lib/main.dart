import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:papyros/core/simple_bloc_observer.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/functions/service_locator.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/core/utils/manager/audio_handling_cubit/audio_handling_cubit.dart';
import 'package:papyros/core/utils/manager/locale_cubit/change_local_cubit.dart';
import 'package:papyros/core/utils/manager/theme_cubit/cubit/theme_cubit.dart';
import 'package:papyros/features/chat_room/data/data_source/chat_room_data_source.dart';
import 'package:papyros/features/chat_room/data/repos/group_chat_repo_imp.dart';
import 'package:papyros/features/chat_room/presentation/manager/group_chat_cubit.dart';
import 'package:papyros/features/groups/data/data_source/groups_data_source_imp.dart';
import 'package:papyros/features/groups/data/repos/groups_rep_imp.dart';
import 'package:papyros/features/groups/domain/use_case/add_group_usecase.dart';
import 'package:papyros/features/groups/presentation/manager/add_group_cubit/add_group_cubit.dart';
import 'package:papyros/features/home/data/data_sources/repost_data_source_imp.dart';
import 'package:papyros/features/home/data/data_sources/search_mention_data_source_impl.dart';
import 'package:papyros/features/home/data/repositories/repost_repo_impl.dart';
import 'package:papyros/features/home/data/repositories/search_mention_repo_impl.dart';
import 'package:papyros/features/home/domain/use_cases/add_like_usecase.dart';
import 'package:papyros/features/home/domain/use_cases/get_all_posts_usecase.dart';
import 'package:papyros/features/home/domain/use_cases/get_recommand_posts_usecase.dart';
import 'package:papyros/features/home/domain/use_cases/repost_usecase.dart';
import 'package:papyros/features/home/domain/use_cases/search_mention_usecase.dart';
import 'package:papyros/features/home/presentation/view/manager/add_like_cubit/add_like_cubit.dart';
import 'package:papyros/features/home/presentation/view/manager/get_all_posts/get_all_posts_cubit.dart';
import 'package:papyros/features/home/presentation/view/manager/get_recomm_posts_cubit/get_recomm_posts_cubit.dart';
import 'package:papyros/features/home/presentation/view/manager/pick_post_image/pick_post_image_cubit.dart';
import 'package:papyros/features/home/presentation/view/manager/repost_cubit/repost_cubit.dart';
import 'package:papyros/features/home/presentation/view/manager/search_mention_cubit/search_mention_cubit.dart';
import 'package:papyros/features/messaging/data/data_source/chat_data_source.dart';
import 'package:papyros/features/messaging/data/repos/chat_repo_imp.dart';
import 'package:papyros/features/messaging/domain/use_cases/get_contact_use_case.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:papyros/features/messaging/presentation/manager/get_contacts_cubit/get_contacts_cubit.dart';
import 'package:papyros/features/profile_management/domain/use_cases/get_user_use_case.dart';
import 'package:papyros/features/profile_management/domain/use_cases/update_use_case.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:papyros/features/profile_management/presentation/manager/update_user_cubit/update_user_cubit.dart';
import 'package:papyros/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefasHandelr.init();
  PrefasHandelr.printAuthToken();
  await dotenv.load(fileName: "lib/.env");
  Bloc.observer = SimpleBlocObserver();
  setupServiceLoactor();

  final bool isDarkMode = PrefasHandelr.prefs.getBool('is_dark_mode') ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChangeLocalCubit()),
        BlocProvider(create: (context) => ThemeCubit()..setTheme(isDarkMode)),
        BlocProvider(
            create: (context) =>
                GetUserProfileCubit(getIt.get<GetUserProfileUseCase>())),
        BlocProvider(
            create: (context) =>
                GetAllPostsCubit(getIt.get<GetPostsUsecase>())),
        BlocProvider(
            create: (context) =>
                GetRecommPostsCubit(getIt.get<GetRecommandPostsUsecase>())),
        BlocProvider(
            create: (context) =>
                UpdateUserCubit(getIt.get<UpdateUserProfileUseCase>())),
        BlocProvider(
            create: (context) =>
                GetContactsCubit(getIt.get<GetContactUseCase>())),
        BlocProvider(
            create: (context) => ChatCubit(
                repository:
                    ChatRepositoryImpl(datasource: ChatSocketDatasource()))),
        BlocProvider(
            create: (context) => RepostCubit(RepostUsecase(
                repostRepo: RepostRepoImpl(
                    repostDataSource: RepostDataSourceImp(dio: Dio()))))),
        BlocProvider(
            create: (context) => SearchMentionCubit(SearchMentionUsecase(
                searchRepo: SearchMentionRepoImpl(
                    searchDataSource:
                        SearchMentionDataSourceImpl(dio: Dio()))))),
        BlocProvider(
            create: (context) => AddGroupCubit(AddGroupUsecase(
                groupRepo: GroupsRepoImp(
                    groupsDataSource: GroupsDataSourceImp(dio: Dio()))))),
        BlocProvider(
            create: (context) => AddLikeCubit(
                  getIt.get<AddLikeUscase>(),
                )),
        BlocProvider(
          create: (context) => GroupChatCubit(
              repository: GroupChatRepositoryImpl(
                  datasource: GroupChatSocketDatasource())),
        ),
        BlocProvider(
          create: (context) => PickPostImageCubit(),
        ),
        BlocProvider(create: (context) => AudioHandlingCubit()),
      ],
      child: const PapyrosApp(),
    ),
  );
}

class PapyrosApp extends StatefulWidget {
  const PapyrosApp({super.key});

  @override
  State<PapyrosApp> createState() => _PapyrosAppState();
}

class _PapyrosAppState extends State<PapyrosApp> {
  Locale _locale = const Locale('en');
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    final isDarkMode = PrefasHandelr.prefs.getBool('is_dark_mode') ?? false;
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MultiBlocListener(
          listeners: [
            BlocListener<ChangeLocalCubit, ChangeLocalState>(
              listener: (context, state) {
                if (state is ChangeLocalCurrent) {
                  setState(() {
                    _locale = state.currentLocale;
                  });
                }
              },
            ),
            BlocListener<ThemeCubit, ThemeState>(
              listener: (context, state) {
                if (state is ThemeChanged) {
                  setState(() {
                    _themeMode = state.themeMode;
                  });
                }
              },
            ),
          ],
          child: MaterialApp.router(
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.backGroundColor,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: AppColors.darkBackGroundColor,
              brightness: Brightness.dark,
            ),
            themeMode: _themeMode,
            locale: _locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}

bool isArabic() => Intl.getCurrentLocale() == 'ar';
