import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/featured_book_cubit/featured_book_state.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/featured_bookd_list_view_loading_indicator.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is FeaturedBookSuccess) {
          return FeaturedBooksListView(books: state.books);
        } else if (state is FeaturedBookPaginationLoading) {
          return Stack(
            children: [
              FeaturedBooksListView(books: state.books),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.amber,
                  ),
                ),
              ),
            ],
          );
        }
        return const Center(child: FeaturedBookdListViewLoadingIndicator());
      },
    );
  }
}
