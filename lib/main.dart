import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/app_router.dart';

void main() {
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
            routerConfig: AppRouter.router,
          );
        });
  }
}
