// newest_books_list_view.dart
import 'package:bookly_app_with_clean_architecture/core/utilis/routes.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/newest_books/newest_book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
    required this.books,
    this.showLoadingIndicatorAtEnd = false,
  });

  final List<BookEntity> books;
  final bool showLoadingIndicatorAtEnd;

  @override
  Widget build(BuildContext context) {
    final childCount = books.length + (showLoadingIndicatorAtEnd ? 1 : 0);

    return SliverList(
      key: const PageStorageKey('newest_books_key'),
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index < books.length) {
          final book = books[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(Routes.bookDetailsView, extra: book);
              },
              child: NewestBookListViewItem(bookEntity: book),
            ),
          );
        } else {
          // لودر الـ pagination في الآخر فقط
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: SizedBox(
                height: 26,
                width: 26,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.amber,
                ),
              ),
            ),
          );
        }
      }, childCount: childCount),
    );
  }
}
