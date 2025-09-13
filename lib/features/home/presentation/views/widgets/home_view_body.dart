import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/featured_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppBar(),
              ),
              FeaturedBooksListViewBlocBuilder(),
              SizedBox(height: height * 0.065),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Text('Best Seller', style: Styles.font18W600),
              ),
            ],
          ),
        ),
        const SliverFillRemaining(child: BestSellerListView()),
      ],
    );
  }
}
