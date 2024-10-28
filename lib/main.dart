import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/simple_bloc_observer.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:intl/intl.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const PapyrosApp());
}

class PapyrosApp extends StatelessWidget {
  const PapyrosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return MaterialApp.router(
            theme:
                ThemeData(scaffoldBackgroundColor: AppColors.backGroundColor),
            locale: const Locale('en'),
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
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
