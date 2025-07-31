import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push('/bookDetailsView');
            },
            child: const BestSellerListViewItem(),
          ),
        );
      },
      itemCount: 5,
      scrollDirection: Axis.vertical,
    );
  }
}
