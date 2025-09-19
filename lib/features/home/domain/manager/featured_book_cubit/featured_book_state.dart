import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class FeaturedBookState {}

class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}

class FeaturedBookFailure extends FeaturedBookState {
  final String errorMessage;
  FeaturedBookFailure(this.errorMessage);
}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookEntity> books;
  FeaturedBookSuccess(this.books);
}

class FeaturedBookPaginationLoading extends FeaturedBookState {
  final List<BookEntity> books;
  FeaturedBookPaginationLoading(this.books);
}

class FeaturedBookPaginationFailure extends FeaturedBookState {
  final String errorMessage;
  FeaturedBookPaginationFailure(this.errorMessage);
}
