import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment,
    required this.bookRating,
    this.ratingsCount,
  });
  final MainAxisAlignment? mainAxisAlignment;
  final BookEntity bookRating;
  final int? ratingsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xFFFFDD4F),
          size: 13.4,
        ),
        const SizedBox(width: 6),
        Text((bookRating.rating ?? 4.8).toString(), style: Styles.font15Normal),
        const SizedBox(width: 5),
        Text(
          "(${ratingsCount.toString()})",
          style: Styles.font14Normal.copyWith(
            color: const Color(0xFF707070),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
