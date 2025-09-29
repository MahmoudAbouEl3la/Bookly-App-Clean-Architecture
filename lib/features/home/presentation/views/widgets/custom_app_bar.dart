import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/settings/theme/app_theme_cubit/app_theme_cubit.dart';
import 'package:bookly_app_with_clean_architecture/core/settings/theme/app_theme_cubit/app_theme_state.dart';
import 'package:bookly_app_with_clean_architecture/core/utilis/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        final themeCubit = context.watch<AppThemeCubit>();
        final isDark = themeCubit.currentTheme == ThemeModeState.dark;

        return Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Row(
            children: [
              Image.asset(
                ImagePath.kLogoImage,
                width: 110,
                color: isDark ? kSecondaryColor : kPrimaryColor,
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      final nextIndex =
                          (themeCubit.currentTheme.index + 1) %
                          ThemeModeState.values.length;
                      themeCubit.selectTheme(ThemeModeState.values[nextIndex]);
                    },
                    icon: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      size: 22,
                      color: isDark ? kSecondaryColor : kPrimaryColor,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      GoRouter.of(context).push(Routes.searchView);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
