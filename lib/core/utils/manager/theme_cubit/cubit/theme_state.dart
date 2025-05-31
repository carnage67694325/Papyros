part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

class ThemeChanged extends ThemeState {
  final ThemeMode themeMode;
  final bool isDarkMode;

  ThemeChanged({required this.themeMode, required this.isDarkMode});
}
