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
import 'package:papyros/generated/l10n.dart';
import 'package:intl/intl.dart';

import 'core/Prefernces/Shaerdperefeancses.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefasHandelr.init();
  // PrefasHandelr().clearAuthToken();
  await dotenv.load(fileName: "lib/.env");
  Bloc.observer = SimpleBlocObserver();
  setupServiceLoactor();
  runApp(BlocProvider(
    create: (context) => ChangeLocalCubit(),
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
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return BlocConsumer<ChangeLocalCubit, ChangeLocalState>(
              listener: (context, state) {
            if (state is ChangeLocalCurrent) {
              local = state.currentLocale;
            }
          }, builder: (context, state) {
            return MaterialApp.router(
              theme:
                  ThemeData(scaffoldBackgroundColor: AppColors.backGroundColor),
              locale: local,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              routerConfig: AppRouter.router,
            );
          });
        });
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
// No changes to ChangeLocalCubit and GettingStartedBody (already provided)
