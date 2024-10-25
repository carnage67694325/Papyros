import 'package:go_router/go_router.dart';
import 'package:papyros/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
  ]);
}
