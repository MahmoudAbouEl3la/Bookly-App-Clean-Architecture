import 'package:bookly_app_with_clean_architecture/core/errors/failures.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks();
}
