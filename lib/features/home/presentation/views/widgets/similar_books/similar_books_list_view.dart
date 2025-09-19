import 'package:bookly_app_with_clean_architecture/core/utilis/routes.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/similar_book_cubit.dart/similar_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({super.key, required this.book});
  final List<BookEntity> book;

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  static const double _triggerPercent = 70;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void onScroll() async {
    if (!scrollController.hasClients) return;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (maxScrollLength <= 0) return;
    var currentPosition = scrollController.position.pixels;
    var distance = (currentPosition / maxScrollLength) * 100;
    if (distance >= _triggerPercent && !isLoading) {
      if (!isLoading) {
        isLoading = true;
        await context.read<SimilarBookCubit>().fetchSimilarbooks(
          page: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: widget.book.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(Routes.bookDetailsView, extra: widget.book[index]);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: CustomBookImage(imageUrl: widget.book[index].image ?? ""),
            ),
          ),
        );
      },
    );
  }
}
