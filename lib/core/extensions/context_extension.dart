import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app_with_clean_architecture/core/settings/theme/app_theme_cubit/app_theme_cubit.dart';

extension ThemeExtension on BuildContext {
  bool get isDarkMode {
    return watch<AppThemeCubit>().currentTheme == ThemeModeState.dark;
  }
}
