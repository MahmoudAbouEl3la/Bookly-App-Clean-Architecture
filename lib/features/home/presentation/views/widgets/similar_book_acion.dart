import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBookAction extends StatelessWidget {
  const SimilarBookAction({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
