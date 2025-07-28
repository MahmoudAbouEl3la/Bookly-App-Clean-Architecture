import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewHomeItem extends StatelessWidget {
  const FeaturedBooksListViewHomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(ImagePath.kBackgroundImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
