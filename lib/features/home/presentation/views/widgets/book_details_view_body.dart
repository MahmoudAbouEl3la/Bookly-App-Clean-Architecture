import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/book_rating.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/custom_book_datails_app_bar.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return ListView(
      children: [
        SizedBox(height: height * 0.034),
        const CustomBookDatailsAppBar(),
        SizedBox(height: height * 0.027),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.25),
          child: Container(color: Colors.white, child: CustomBookImage()),
        ),
        SizedBox(height: height * 0.048),
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
            const SizedBox(height: 14),
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
            const SizedBox(height: 14),
            BookRating(mainAxisAlignment: MainAxisAlignment.center),
            const SizedBox(height: 32),
            const BookAction(),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("You can also like", style: Styles.font14Normal),
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: height * 0.12,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SimilarBooksListView(),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}
