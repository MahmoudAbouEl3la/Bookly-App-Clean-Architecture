import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class NewestBookState {}

class NewestBookInitial extends NewestBookState {}

class NewestBookLoading extends NewestBookState {}

class NewestBookFailure extends NewestBookState {
  final String errorMessage;
  NewestBookFailure(this.errorMessage);
}

class NewestBookSuccess extends NewestBookState {
  final List<BookEntity> books;
  NewestBookSuccess(this.books);
}

class NewestBookPaginationLoading extends NewestBookState {
  final List<BookEntity> books;
  NewestBookPaginationLoading(this.books);
}

class NewestBookPaginationFailure extends NewestBookState {
  final String errorMessage;
  NewestBookPaginationFailure(this.errorMessage);
}
