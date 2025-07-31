import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/custom_book_datails_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const SizedBox(height: 40), const CustomBookDatailsAppBar()],
    );
  }
}
