import 'package:bookly_app_with_clean_architecture/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  /// Fetches a list of featured books asynchronously.
  ///
  /// Returns a [Future] that completes with a [List] of [BookModel]s representing
  /// the featured books. Throws an exception if the fetch operation fails.
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}
