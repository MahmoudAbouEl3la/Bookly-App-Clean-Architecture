import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(ImagePath.kTestImage),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
