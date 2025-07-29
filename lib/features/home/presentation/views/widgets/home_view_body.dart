import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomAppBar(),
        ),
        const FeaturedBooksListView(),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('Best Seller', style: Styles.font18W600),
        ),
        const BestSellerListView(),
      ],
    );
  }
}
