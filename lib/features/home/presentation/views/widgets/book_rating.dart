import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(FontAwesomeIcons.solidStar, color: Color(0xFFFFDD4F)),
        const SizedBox(width: 6),
        const Text('4.9', style: Styles.font16W500),
        const SizedBox(width: 5),
        Text(
          '(2508)',
          style: Styles.font14Normal.copyWith(color: const Color(0xFF707070)),
        ),
      ],
    );
  }
}
