import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/data_source/local_data_source/home_local_data_source.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int page = 0}) {
    int startIndex = page * 10;
    int endIndex = (page + 1) * 10;

    final box = Hive.box<BookEntity>(kFeaturedBox);
    var length = box.values.length;
    if (startIndex >= length) return [];
    if (endIndex > length) endIndex = length;
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    final box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
