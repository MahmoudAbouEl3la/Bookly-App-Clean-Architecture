// newest_books_list_view_bloc_builder.dart
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/newest_book_cubit/newest_book_state.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/newest_books/newest_books_list_view.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBookFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(state.errorMessage, textAlign: TextAlign.center),
              ),
            ),
          );
        } else if (state is NewestBookLoading) {
          // لودر النص الأساسي
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is NewestBookSuccess) {
          return NewestBooksListView(books: state.books);
        } else if (state is NewestBookPaginationLoading) {
          return NewestBooksListView(
            books: state.books,
            showLoadingIndicatorAtEnd: true,
          );
        }

        return const SliverToBoxAdapter(child: BooksListViewLoadingIndicator());
      },
    );
  }
}
