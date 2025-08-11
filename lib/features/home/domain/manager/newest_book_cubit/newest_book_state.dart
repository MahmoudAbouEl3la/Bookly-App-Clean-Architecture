import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class NewestBookState {}

class NewestBookInitial extends NewestBookState {}

class NewestBookLoading extends NewestBookState {}

class NewestBookSuccess extends NewestBookState {
  final List<BookEntity> books;
  NewestBookSuccess(this.books);
}

class NewestBookFailure extends NewestBookState {
  final String errorMessage;
  NewestBookFailure(this.errorMessage);
}
