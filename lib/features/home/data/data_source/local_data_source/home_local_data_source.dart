import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int page = 0});
  List<BookEntity> fetchNewestBooks({int page = 0});
  List<BookEntity> fetchSimilarBooks({int page = 0});
}
