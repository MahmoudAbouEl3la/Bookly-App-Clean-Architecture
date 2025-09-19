import 'package:bookly_app_with_clean_architecture/core/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/book_details/book_details_section.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/book_details/custom_book_datails_app_bar.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/similar_books/similar_book_acion.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                SizedBox(height: height * 0.05),
                const CustomBookDatailsAppBar(),
                SizedBox(height: height * 0.027),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CustomBookImage(imageUrl: book.image ?? ""),
                  ),
                ),
                SizedBox(height: height * 0.048),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BookDetailsSection(book: book),
                    const SizedBox(height: 40),
                    SimilarBookAction(height: height),
                    SizedBox(height: 60),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
