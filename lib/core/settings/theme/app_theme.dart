import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: kSecondaryColor,
    primaryColor: kPrimaryColor,
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: kPrimaryColor,
    primaryColor: kSecondaryColor,
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
  );
}
