import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchsearchBooks({
    int page = 0,
    required String query,
  });
}
