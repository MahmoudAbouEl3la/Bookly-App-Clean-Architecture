import 'package:bookly_app_with_clean_architecture/core/settings/theme/app_theme_cubit/app_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

enum ThemeModeState { light, dark }

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial()) {
    loadTheme();
  }

  ThemeModeState currentTheme = ThemeModeState.dark;

  static AppThemeCubit get(context) => BlocProvider.of(context);

  void selectTheme(ThemeModeState theme) async {
    if (currentTheme == theme) return;

    currentTheme = theme;
    await Hive.box('settings').put('theme', theme.index);
    emit(AppThemeChanged(currentTheme));
  }

  void loadTheme() {
    final savedThemeIndex = Hive.box('settings').get('theme') as int?;
    if (savedThemeIndex != null) {
      currentTheme = ThemeModeState.values[savedThemeIndex];
      emit(AppThemeChanged(currentTheme));
    }
  }

  ThemeMode getTheme() {
    switch (currentTheme) {
      case ThemeModeState.light:
        return ThemeMode.light;
      case ThemeModeState.dark:
        return ThemeMode.dark;
    }
  }
}
