import 'package:bookly_app_with_clean_architecture/features/home/data/data_source/local_data_source/home_local_data_source.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {}

  @override
  List<BookEntity> fetchNewestBooks() {}
}
