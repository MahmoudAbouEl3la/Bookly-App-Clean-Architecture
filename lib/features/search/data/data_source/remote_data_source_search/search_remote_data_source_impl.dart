import 'package:bookly_app_with_clean_architecture/core/utilis/api_service.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/search/data/data_source/remote_data_source_search/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;
  SearchRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchsearchBooks({
    int page = 0,
    required String query,
  }) async {
    final data = await apiService.get(
      endPoint:
          "volumes?Filtering=free-ebooks&Sorting=newest&q=$query&startIndex=${page * 10}",
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    if (data["items"] != null) {
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
    }
    return books;
  }
}
