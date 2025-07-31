import 'package:bookly_app_with_clean_architecture/core/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBookImage();
  }
}
