import 'package:bookly_app_with_clean_architecture/features/search/domain/manager/search_books_cubit/search_books_state.dart';
import 'package:bookly_app_with_clean_architecture/features/search/domain/search_use_case/fetch_search_books_use_case.dart';
import 'package:bookly_app_with_clean_architecture/features/search/domain/search_use_case/search_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  final FetchSearchBooksUseCase fetchSearchBooksUseCase;
  String currentQuery = '';

  SearchBooksCubit(this.fetchSearchBooksUseCase) : super(SearchBooksInitial());

  Future<void> fetchSearchBooks({required String query, int page = 0}) async {
    if (query.isEmpty) {
      resetSearch();
      return;
    }

    currentQuery = query;
    if (state is SearchBooksSuccess && page > 0) {
      final oldBooks = (state as SearchBooksSuccess).books;
      emit(SearchBooksPaginationLoading(oldBooks));
      var failureOrBooks = await fetchSearchBooksUseCase(
        SearchParams(query: query, page: page),
      );
      emit(
        failureOrBooks.fold(
          (failure) => SearchBooksPaginationFailure(failure.message),
          (books) => SearchBooksSuccess([...oldBooks, ...books]),
        ),
      );
      return;
    }

    emit(SearchBooksLoading());
    var failureOrBooks = await fetchSearchBooksUseCase(
      SearchParams(query: query, page: page),
    );
    emit(
      failureOrBooks.fold(
        (failure) => SearchBooksFailure(failure.message),
        (books) => SearchBooksSuccess(books),
      ),
    );
  }

  void resetSearch() {
    emit(SearchBooksInitial());
  }
}
