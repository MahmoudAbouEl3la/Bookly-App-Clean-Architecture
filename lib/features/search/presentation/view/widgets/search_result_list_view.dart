import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/newest_books/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push('/bookDetailsView');
            },
            child: NewestBooksListView(books: books),
          ),
        );
      },
      itemCount: books.length,
      scrollDirection: Axis.vertical,
    );
  }
}
