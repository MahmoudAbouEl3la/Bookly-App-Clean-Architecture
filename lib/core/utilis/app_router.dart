import 'package:bookly_app_with_clean_architecture/core/functions/setup_service_locator.dart';
import 'package:bookly_app_with_clean_architecture/core/utilis/routes.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_featured_books_use_cases.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/home_view.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/search_view.dart';
import 'package:bookly_app_with_clean_architecture/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create:
                    (context) => FeaturedBookCubit(
                      FetchFeaturedBooksUseCases(
                        homeRepo: getIt.get<HomeRepoImpl>(),
                      ),
                    ),
              ),
              BlocProvider(
                create:
                    (context) => NewestBookCubit(
                      FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()),
                    ),
              ),
            ],
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: Routes.bookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return const BookDetailsView();
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
