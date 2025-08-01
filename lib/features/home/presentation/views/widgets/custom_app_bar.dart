import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/utilis/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Image.asset(ImagePath.kLogoImage, width: 110),
          Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(Routes.searchView);
            },
            icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
          ),
        ],
      ),
    );
  }
}
