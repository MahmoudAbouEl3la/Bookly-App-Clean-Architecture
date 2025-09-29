import 'package:bookly_app_with_clean_architecture/core/settings/theme/app_theme_cubit/app_theme_cubit.dart';
import 'package:equatable/equatable.dart';

abstract class AppThemeState extends Equatable {
  const AppThemeState();

  @override
  List<Object?> get props => [];
}

class AppThemeInitial extends AppThemeState {}

class AppThemeChanged extends AppThemeState {
  final ThemeModeState theme;

  const AppThemeChanged(this.theme);

  @override
  List<Object?> get props => [theme];
}
