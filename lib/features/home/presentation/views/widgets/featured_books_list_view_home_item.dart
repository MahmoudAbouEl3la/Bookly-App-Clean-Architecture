import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(ImagePath.kBackgroundImage),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
