import 'package:bookly_app_with_clean_architecture/core/utilis/routes.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  bool isLoading = false;
  static const double _triggerPercent = 70;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onScroll() async {
    if (!_scrollController.hasClients) return;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (maxScrollLength <= 0) return;
    var currentPosition = _scrollController.position.pixels;
    var distance = (currentPosition / maxScrollLength) * 100;
    if (distance >= _triggerPercent && !isLoading) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBookCubit>(
          context,
        ).fetchFeaturedBooks(page: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(
                  context,
                ).push(Routes.bookDetailsView, extra: widget.books[index]);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: CustomBookImage(
                  imageUrl: widget.books[index].image ?? "",
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
