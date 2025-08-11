import 'package:bloc/bloc.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/featured_book_cubit/featured_book_state.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_featured_books_use_cases.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  final FetchFeaturedBooksUseCases featuredBooksUseCases;

  FeaturedBookCubit(this.featuredBooksUseCases) : super(FeaturedBookInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var result = await featuredBooksUseCases.call();
    result.fold(
      (failure) => emit(FeaturedBookFailure(failure.message)),
      (books) => emit(FeaturedBookSuccess(books)),
    );
  }
}
