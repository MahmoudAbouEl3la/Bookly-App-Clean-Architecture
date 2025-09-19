import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/newest_book_cubit/newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  final FetchNewestBooksUseCase newestBooksUseCase;

  NewestBookCubit(this.newestBooksUseCase) : super(NewestBookInitial());

  Future<void> fetchNewestBooks({int page = 0}) async {
    if (state is NewestBookSuccess && page > 0) {
      // حالة تحميل المزيد (Pagination)
      final oldBooks = (state as NewestBookSuccess).books;
      emit(NewestBookPaginationLoading(oldBooks));

      final result = await newestBooksUseCase.call(page);
      result.fold(
        (failure) => emit(NewestBookPaginationFailure(failure.message)),
        (newBooks) => emit(NewestBookSuccess([...oldBooks, ...newBooks])),
      );
    } else {
      // تحميل البيانات لأول مرة
      emit(NewestBookLoading());

      final result = await newestBooksUseCase.call(page);
      result.fold(
        (failure) => emit(NewestBookFailure(failure.message)),
        (books) => emit(NewestBookSuccess(books)),
      );
    }
  }
}
