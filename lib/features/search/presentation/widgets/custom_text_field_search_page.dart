import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/extensions/context_extension.dart';
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

  OutlineInputBorder _borderStyle() {
    final isDark = context.isDarkMode;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: isDark ? kGreyColor : kSecondaryColor,
        width: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        style: TextStyle(
          fontSize: 14,
          color: isDark ? kGreyColor : kSecondaryColor,
        ),
        controller: textEditingController,
        onSubmitted: (value) {
          final query = value.trim();
          if (query.isNotEmpty) {
            context.read<SearchBooksCubit>().fetchSearchBooks(query: query);
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: isDark ? const Color(0xFF32244D) : kGreyColor,
          enabledBorder: _borderStyle(),
          focusedBorder: _borderStyle(),
          disabledBorder: _borderStyle(),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 14,
            color: isDark ? kGreyColor : kSecondaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              final query = textEditingController.text.trim();
              if (query.isNotEmpty) {
                BlocProvider.of<SearchBooksCubit>(
                  context,
                ).fetchSearchBooks(query: query);
              }
            },
            icon: Icon(
              Icons.search_rounded,
              color: isDark ? kGreyColor : kSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
