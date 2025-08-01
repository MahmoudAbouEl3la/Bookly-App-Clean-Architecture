import 'package:bookly_app_with_clean_architecture/core/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/custom_book_datails_app_bar.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/similar_book_acion.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
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
                  BookDetailsSection(),
                  const SizedBox(height: 40),
                  SimilarBookAction(height: height),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
