import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: const BestSellerListViewItem(),
          );
        },
        itemCount: 5,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
