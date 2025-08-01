import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        decoration: InputDecoration(
          enabled: true,
          filled: true,
          fillColor: const Color(0xFF160F31),
          border: buildOutLineInputBorder(),
          focusedBorder: buildOutLineInputBorder(),
          suffixIcon: Opacity(
            opacity: 0.7,
            child: IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
            ),
          ),

          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color(0xFF707070),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: kGtSectraFine,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
