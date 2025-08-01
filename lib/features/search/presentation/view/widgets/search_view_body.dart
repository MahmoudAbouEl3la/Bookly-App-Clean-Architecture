import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchTextField(),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 15,
            top: 15,
          ),
          child: Text('Search Result', style: Styles.font16W600),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchResultListView(),
          ),
        ),
      ],
    );
  }
}
