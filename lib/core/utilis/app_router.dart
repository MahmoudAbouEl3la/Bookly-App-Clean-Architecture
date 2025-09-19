import 'package:bookly_app_with_clean_architecture/core/utilis/routes.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/book_details/book_details_view.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/home_view.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/search_view.dart';
import 'package:bookly_app_with_clean_architecture/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashView,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: Routes.homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: Routes.bookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          final book = state.extra as BookEntity;
          return BookDetailsView(book: book);
        },
      ),
      GoRoute(
        path: Routes.searchView,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
    ],
  );
}
