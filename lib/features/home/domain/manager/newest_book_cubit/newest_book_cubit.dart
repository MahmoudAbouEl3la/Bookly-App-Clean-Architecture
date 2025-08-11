import 'package:bloc/bloc.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/newest_book_cubit/newest_book_state.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/fetch_newest_books_use_case.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  NewestBookCubit(this.fetchNewestBooksUseCase) : super(NewestBookInitial());
  Future<void> fetchNewestBooks() async {
    emit(NewestBookLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold(
      (error) {
        emit(NewestBookFailure(error.message));
      },
      (books) {
        emit(NewestBookSuccess(books));
      },
    );
  }
}
