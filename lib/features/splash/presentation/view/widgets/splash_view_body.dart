import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(ImagePath.kLogoImage),
        const SizedBox(height: 4),
        const Text('Read Free Book', textAlign: TextAlign.center),
      ],
    );
  }
}
