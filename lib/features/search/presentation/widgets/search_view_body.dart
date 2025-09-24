import 'package:bookly_app_with_clean_architecture/features/search/presentation/widgets/custom_list_view_search_page.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/widgets/custom_text_field_search_page.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        CustomTextFieldSearchPage(),
        SizedBox(height: 5),
        Expanded(child: CustomListViewSearchPage()),
      ],
    );
  }
}
