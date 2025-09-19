import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class SimilarBookState {}

class SimilarBookInitial extends SimilarBookState {}

class SimilarLoadingBookState extends SimilarBookState {}

class SimilarBookFailureState extends SimilarBookState {
  final String message;
  SimilarBookFailureState(this.message);
}

class SimilarBookSuccessState extends SimilarBookState {
  final List<BookEntity> books;
  SimilarBookSuccessState(this.books);
}

class LoadingSimilarPaginationBookState extends SimilarBookState {
  final List<BookEntity> books;
  LoadingSimilarPaginationBookState(this.books);
}

class FailureSimilarPaginationBookState extends SimilarBookState {
  final String errorMessage;
  FailureSimilarPaginationBookState(this.errorMessage);
}
