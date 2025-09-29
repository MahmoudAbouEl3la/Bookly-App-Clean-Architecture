import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/extensions/context_extension.dart';
import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/book_rating.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/book_action.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          book.title,
          style: Styles.font30Normal.copyWith(
            fontFamily: kGtSectraFine,
            fontWeight: FontWeight.w700,
            color: isDark ? kSecondaryColor : kPrimaryColor,
          ),
        ),
        const SizedBox(height: 14),
        Opacity(
          opacity: 0.8,
          child: Text(
            textAlign: TextAlign.center,
            book.authorName ?? "unknown",
            style: Styles.font18W600.copyWith(
              color: isDark ? kSecondaryColor : kGreyColor,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 14),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          bookRating: book,
        ),
        const SizedBox(height: 32),
        BookAction(bookEntity: book),
      ],
    );
  }
}
