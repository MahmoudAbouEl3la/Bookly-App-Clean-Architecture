import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/functions/setup_service_locator.dart';
import 'package:bookly_app_with_clean_architecture/core/utilis/app_router.dart';
import 'package:bookly_app_with_clean_architecture/core/utilis/simple_bloc_observer.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_featured_books_use_cases.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(DevicePreview(enabled: false, builder: (context) => BooklyApp()));
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => FeaturedBookCubit(
                FetchFeaturedBooksUseCases(homeRepo: getIt.get<HomeRepoImpl>()),
              )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create:
              (context) => NewestBookCubit(
                FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()),
              )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        routerConfig: AppRouter.router,
        useInheritedMediaQuery: true,

        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
