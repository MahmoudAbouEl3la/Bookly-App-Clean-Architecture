import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/search/domain/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/search/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksListView extends StatefulWidget {
  const SearchBooksListView({
    super.key,
    required this.books,
    this.showLoadingIndicatorAtEnd = false,
  });

  final List<BookEntity> books;
  final bool showLoadingIndicatorAtEnd;

  @override
  State<SearchBooksListView> createState() => _SearchBooksListViewState();
}

class _SearchBooksListViewState extends State<SearchBooksListView> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  final int triggerPercent = 70;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> onScroll() async {
    if (!scrollController.hasClients) return;

    final maxScrollLength = scrollController.position.maxScrollExtent;
    if (maxScrollLength <= 0) return;

    final currentPosition = scrollController.position.pixels;
    final distance = (currentPosition / maxScrollLength) * 100;

    if (distance >= triggerPercent && !isLoading) {
      isLoading = true;
      await context.read<SearchBooksCubit>().fetchSearchBooks(
        page: nextPage++,
        query: context.read<SearchBooksCubit>().currentQuery,
      );
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount:
            widget.books.length + (widget.showLoadingIndicatorAtEnd ? 1 : 0),
        itemBuilder: (context, index) {
          if (widget.showLoadingIndicatorAtEnd &&
              index == widget.books.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: CustomListViewItem(bookEntity: widget.books[index]),
          );
        },
      ),
    );
  }
}
