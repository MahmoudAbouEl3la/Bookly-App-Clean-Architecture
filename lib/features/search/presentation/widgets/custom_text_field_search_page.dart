import 'package:bookly_app_with_clean_architecture/features/search/domain/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFieldSearchPage extends StatefulWidget {
  const CustomTextFieldSearchPage({super.key});

  @override
  State<CustomTextFieldSearchPage> createState() =>
      _CustomTextFieldSearchPageState();
}

class _CustomTextFieldSearchPageState extends State<CustomTextFieldSearchPage> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      final query = textEditingController.text.trim();
      if (query.isNotEmpty) {
        context.read<SearchBooksCubit>().fetchSearchBooks(query: query);
      } else if (query.isEmpty) {
        context.read<SearchBooksCubit>().resetSearch();
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: textEditingController,
        onSubmitted: (value) {
          final query = value.trim();
          if (query.isNotEmpty) {
            context.read<SearchBooksCubit>().fetchSearchBooks(query: query);
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0x832E2158),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon: IconButton(
            onPressed: () {
              final query = textEditingController.text.trim();
              if (query.isNotEmpty) {
                BlocProvider.of<SearchBooksCubit>(
                  context,
                ).fetchSearchBooks(query: query);
              }
            },
            icon: Icon(Icons.search_rounded),
          ),
        ),
      ),
    );
  }
}
