import 'package:bookly_app_with_clean_architecture/core/utilis/routes.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/widgets/search_books_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routes.bookDetailsView, extra: bookEntity);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .17,
              child: CustomBookImage(imageUrl: bookEntity.image ?? ""),
            ),
            SearchBooksDetails(bookEntity: bookEntity),
          ],
        ),
      ),
    );
  }
}
