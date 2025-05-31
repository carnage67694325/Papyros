// 4. Updated main.dart with theme support
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/simple_bloc_observer.dart';
import 'package:papyros/core/utils/functions/service_locator.dart';
import 'package:papyros/core/utils/manager/locale_cubit/change_local_cubit.dart';
import 'package:papyros/core/utils/manager/theme_cubit/cubit/theme_cubit.dart';
// Add theme cubit import
// import 'package:papyros/core/utils/manager/theme_cubit/theme_cubit.dart';
import 'package:papyros/features/home/domain/use_cases/get_all_posts_usecase.dart';
import 'package:papyros/features/home/presentation/view/manager/get_all_posts/get_all_posts_cubit.dart';
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
import 'package:intl/intl.dart';

import 'core/Prefernces/Shaerdperefeancses.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefasHandelr.init();
  await dotenv.load(fileName: "lib/.env");
  Bloc.observer = SimpleBlocObserver();
  setupServiceLoactor();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ChangeLocalCubit(),
      ),
      BlocProvider(
        create: (context) => ThemeCubit(), // Add theme cubit
      ),
      BlocProvider(
          create: (context) =>
              GetUserProfileCubit(getIt.get<GetUserProfileUseCase>())),
      BlocProvider(
        create: (context) => GetAllPostsCubit(getIt.get<GetPostsUsecase>()),
      ),
      BlocProvider(
        create: (context) =>
            UpdateUserCubit(getIt.get<UpdateUserProfileUseCase>()),
      ),
      BlocProvider(
        create: (context) => GetContactsCubit(getIt.get<GetContactUseCase>()),
      ),
      BlocProvider(
        create: (context) => ChatCubit(
            repository: ChatRepositoryImpl(datasource: ChatSocketDatasource())),
      ),
    ],
    child: const PapyrosApp(),
  ));
}

class PapyrosApp extends StatefulWidget {
  const PapyrosApp({super.key});

  @override
  State<PapyrosApp> createState() => _PapyrosAppState();
}

class _PapyrosAppState extends State<PapyrosApp> {
  Locale local = const Locale('en');
  ThemeMode themeMode = ThemeMode.light; // Add theme mode state

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 915),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return MultiBlocListener(
            listeners: [
              BlocListener<ChangeLocalCubit, ChangeLocalState>(
                listener: (context, state) {
                  if (state is ChangeLocalCurrent) {
                    setState(() {
                      local = state.currentLocale;
                    });
                  }
                },
              ),
              BlocListener<ThemeCubit, ThemeState>(
                listener: (context, state) {
                  if (state is ThemeChanged) {
                    setState(() {
                      themeMode = state.themeMode;
                    });
                  }
                },
              ),
            ],
            child: MaterialApp.router(
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.backGroundColor,
                brightness: Brightness.light,
                // Add more light theme properties
              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.grey[900],
                brightness: Brightness.dark,
                // Add more dark theme properties
              ),
              themeMode: themeMode, // Use the theme mode
              locale: local,
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
        });
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
