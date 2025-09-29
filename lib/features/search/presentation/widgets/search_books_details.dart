import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/extensions/context_extension.dart';
import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/raring_and_price.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class SearchBooksDetails extends StatelessWidget {
  const SearchBooksDetails({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              bookEntity.title,
              style: Styles.font20Normal.copyWith(
                fontFamily: kGtSectraFine,
                color: isDark ? kSecondaryColor : kPrimaryColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              bookEntity.authorName ?? "unknown",
              style: Styles.font15Normal.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 7),
            RatingAndPriceWidget(
              rating: 4.8,
              count:
                  bookEntity.rating == null
                      ? "0"
                      : bookEntity.rating.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
