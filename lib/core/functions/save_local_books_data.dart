import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveLocalBooksData(List<BookEntity> books, String boxName) {
  final box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
