import 'package:bookly_app_with_clean_architecture/core/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const CustomBookImage(),
      itemCount: 10,
      scrollDirection: Axis.horizontal,
    );
  }
}
