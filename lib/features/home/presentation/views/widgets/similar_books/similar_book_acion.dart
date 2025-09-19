import 'package:bookly_app_with_clean_architecture/core/functions/setup_service_locator.dart';
import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/similar_book_cubit.dart/similar_book_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/similar_book_cubit.dart/similar_book_state.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/books_list_view_loading_indicator.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/similar_books/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookAction extends StatelessWidget {
  const SimilarBookAction({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SimilarBookCubit(
            FetchSimilarBooksUseCase(getIt.get<HomeRepoImpl>()),
          )..fetchSimilarbooks(),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("You can also like", style: Styles.font14Normal),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: height * 0.12,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: BlocConsumer<SimilarBookCubit, SimilarBookState>(
                listener: (context, state) {
                  if (state is FailureSimilarPaginationBookState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SimilarBookFailureState) {
                    return Center(child: Text(state.message));
                  } else if (state is SimilarBookSuccessState) {
                    return SimilarBooksListView(book: state.books);
                  } else if (state is LoadingSimilarPaginationBookState) {
                    return Stack(
                      children: [
                        SimilarBooksListView(book: state.books),
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
      ),
    );
  }
}
