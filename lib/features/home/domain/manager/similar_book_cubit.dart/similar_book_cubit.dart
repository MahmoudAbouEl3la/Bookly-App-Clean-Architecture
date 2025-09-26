import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/similar_book_cubit.dart/similar_book_state.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/similar_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;
  SimilarBookCubit(this.fetchSimilarBooksUseCase) : super(SimilarBookInitial());

  Future<void> fetchSimilarbooks({int page = 0, required String query}) async {
    final params = SimilarParams(page: page, query: query);

    if (state is SimilarBookSuccessState && page > 0) {
      final oldBooks = (state as SimilarBookSuccessState).books;
      emit(LoadingSimilarPaginationBookState(oldBooks));
      final result = await fetchSimilarBooksUseCase.call(params);
      result.fold(
        (failure) => emit(FailureSimilarPaginationBookState(failure.message)),
        (newBooks) => emit(SimilarBookSuccessState([...oldBooks, ...newBooks])),
      );
    } else {
      emit(SimilarLoadingBookState());
      final result = await fetchSimilarBooksUseCase.call(params);
      result.fold(
        (failure) => emit(SimilarBookFailureState(failure.message)),
        (books) => emit(SimilarBookSuccessState(books)),
      );
    }
  }
}
