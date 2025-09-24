import 'package:bookly_app_with_clean_architecture/features/search/domain/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/search/domain/manager/search_books_cubit/search_books_state.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/widgets/search_books_list_view.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/widgets/search_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewSearchPage extends StatelessWidget {
  const CustomListViewSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksLoading) {
          return const SearchBooksListViewLoadingIndicator();
        } else if (state is SearchBooksSuccess) {
          if (state.books.isEmpty) {
            return const Center(
              child: Text(
                'No results found.\nTry searching for another book.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            );
          }
          return SearchBooksListView(books: state.books);
        } else if (state is SearchBooksPaginationLoading) {
          return SearchBooksListView(
            books: state.books,
            showLoadingIndicatorAtEnd: true,
          );
        } else if (state is SearchBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is SearchBooksInitial) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                'Start searching for books using the search bar above.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
