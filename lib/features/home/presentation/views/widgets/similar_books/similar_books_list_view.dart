import 'package:bookly_app_with_clean_architecture/core/utilis/routes.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({
    super.key,
    required this.books,
    required this.query,
    this.isLoading = false,
  });

  final List<BookEntity> books;
  final String query;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey('similar_books_key'),
      scrollDirection: Axis.horizontal,
      itemCount: books.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == books.length && isLoading) {
          return const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }

        final book = books[index];
        return GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).pushReplacement(Routes.bookDetailsView, extra: book);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CustomBookImage(imageUrl: book.image ?? ""),
          ),
        );
      },
    );
  }
}
