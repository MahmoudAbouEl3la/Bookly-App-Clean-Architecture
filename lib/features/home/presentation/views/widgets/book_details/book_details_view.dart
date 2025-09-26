import 'package:bookly_app_with_clean_architecture/core/functions/setup_service_locator.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/similar_book_cubit.dart/similar_book_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/book_details/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SimilarBookCubit(
            FetchSimilarBooksUseCase(getIt.get<HomeRepoImpl>()),
          )..fetchSimilarbooks(query: book.title.split(" ").first),
      child: Scaffold(body: BookDetailsViewBody(book: book)),
    );
  }
}
