import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/featured_book_cubit/featured_book_state.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_featured_books_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  final FetchFeaturedBooksUseCases featuredBooksUseCases;

  FeaturedBookCubit(this.featuredBooksUseCases) : super(FeaturedBookInitial());

  Future<void> fetchFeaturedBooks({int page = 0}) async {
    if (state is FeaturedBookSuccess && page > 0) {
      final oldBooks = (state as FeaturedBookSuccess).books;
      emit(FeaturedBookPaginationLoading(oldBooks));

      final result = await featuredBooksUseCases.call(page);
      result.fold(
        (failure) => emit(FeaturedBookPaginationFailure(failure.message)),
        (newBooks) => emit(FeaturedBookSuccess([...oldBooks, ...newBooks])),
      );
    } else {
      emit(FeaturedBookLoading());

      final result = await featuredBooksUseCases.call(page);
      result.fold(
        (failure) => emit(FeaturedBookFailure(failure.message)),
        (books) => emit(FeaturedBookSuccess(books)),
      );
    }
  }
}
