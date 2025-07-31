import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/custom_book_datails_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBox(height: height * 0.035),
        const CustomBookDatailsAppBar(),
        SizedBox(height: height * 0.04),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.25),
          child: Container(color: Colors.white, child: CustomBookImage()),
        ),
        SizedBox(height: height * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The Jungle Book',
              style: Styles.font30Normal.copyWith(
                fontFamily: kGtSectraFine,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Opacity(
              opacity: 0.8,
              child: Text(
                'Rudyard Kipling',
                style: Styles.font18W600.copyWith(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
