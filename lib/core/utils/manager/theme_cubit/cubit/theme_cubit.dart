import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    emit(ThemeChanged(
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      isDarkMode: _isDarkMode,
    ));
  }

  void setTheme(bool isDark) {
    _isDarkMode = isDark;
    emit(ThemeChanged(
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      isDarkMode: _isDarkMode,
    ));
  }
}
