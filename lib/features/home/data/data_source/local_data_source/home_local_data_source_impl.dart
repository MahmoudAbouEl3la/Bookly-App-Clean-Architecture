import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/data_source/local_data_source/home_local_data_source.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    final box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    final box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
