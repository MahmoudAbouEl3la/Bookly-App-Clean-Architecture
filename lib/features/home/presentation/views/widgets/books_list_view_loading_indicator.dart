import 'package:bookly_app_with_clean_architecture/core/widgets/custom_fading_widget.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class BooksListViewLoadingIndicator extends StatelessWidget {
  const BooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.3,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder:
              (context, index) => const Padding(
                padding: EdgeInsets.only(right: 8),
                child: CustomBookImageLoadingIndicator(),
              ),
        ),
      ),
    );
  }
}
