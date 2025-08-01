import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push('/bookDetailsView');
            },
            child: const BookListViewItem(),
          ),
        );
      },
      itemCount: 5,
      scrollDirection: Axis.vertical,
    );
  }
}
