import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/books_list_view_loading_indicator.dart';
import 'package:bookly_app_with_clean_architecture/features/search/domain/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/search/domain/manager/search_books_cubit/search_books_state.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchTextField(),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 15,
            top: 15,
          ),
          child: Text('Search Result', style: Styles.font16W600),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocConsumer<SearchBooksCubit, SearchBooksState>(
              listener: (context, state) {
                if (state is SearchBooksPaginationFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errMessage,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is SearchBooksFailure) {
                  return Center(child: Text(state.errMessage));
                } else if (state is SearchBooksLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      backgroundColor: Colors.blueGrey,
                      color: Colors.amber,
                    ),
                  );
                } else if (state is SearchBooksSuccess) {
                  return SearchResultListView(books: state.books);
                } else if (state is SearchBooksPaginationLoading) {
                  return Stack(
                    children: [
                      SearchResultListView(books: state.books),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            backgroundColor: Colors.blueGrey,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const Center(child: BooksListViewLoadingIndicator());
              },
            ),
          ),
        ),
      ],
    );
  }
}
