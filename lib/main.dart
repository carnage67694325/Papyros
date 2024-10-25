import 'package:flutter/material.dart';
import 'package:papyros/app_router.dart';

void main() {
  runApp(const PapyrosApp());
}

class PapyrosApp extends StatelessWidget {
  const PapyrosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
