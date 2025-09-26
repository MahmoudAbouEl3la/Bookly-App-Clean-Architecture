import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/similar_book_cubit.dart/similar_book_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/similar_book_cubit.dart/similar_book_state.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/similar_books/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookAction extends StatelessWidget {
  const SimilarBookAction({
    super.key,
    required this.height,
    required this.bookEntity,
  });

  final double height;
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    final query = bookEntity.title.split(" ").first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You may also like", style: Styles.font14Normal),
        const SizedBox(height: 6),
        SizedBox(
          height: height * 0.12,
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
                return SimilarBooksListView(books: state.books, query: query);
              } else if (state is LoadingSimilarPaginationBookState) {
                return SimilarBooksListView(
                  books: state.books,
                  query: query,
                  isLoading: true, // ← هنا الجديد
                );
              } else if (state is SimilarLoadingBookState) {
                return const Center(child: CircularProgressIndicator());
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
