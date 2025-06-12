import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _prefKey = 'is_dark_mode';
  bool _isDarkMode = false;

  ThemeCubit() : super(ThemeInitial()) {
    _loadTheme();
  }

  bool get isDarkMode => _isDarkMode;

  Future<void> _loadTheme() async {
    final value = PrefasHandelr.prefs.getBool(_prefKey);
    _isDarkMode = value ?? false;
    emit(ThemeChanged(
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      isDarkMode: _isDarkMode,
    ));
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    PrefasHandelr.prefs.setBool(_prefKey, _isDarkMode);
    emit(ThemeChanged(
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      isDarkMode: _isDarkMode,
    ));
  }

  void setTheme(bool isDark) {
    _isDarkMode = isDark;
    PrefasHandelr.prefs.setBool(_prefKey, isDark);
    emit(ThemeChanged(
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      isDarkMode: isDark,
    ));
  }
}
