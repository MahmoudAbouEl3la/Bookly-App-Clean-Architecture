// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/functions/save_local_books_data.dart';
import 'package:bookly_app_with_clean_architecture/core/utilis/api_service.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImp(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int page = 0}) async {
    final data = await apiService.get(
      endPoint:
          "volumes?q=programming&filter=free-ebooks&startIndex=${page * 10}",
    );
    List<BookEntity> books = getBooksList(data);
    saveLocalBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int page = 0}) async {
    final data = await apiService.get(
      endPoint:
          "volumes?q=computer-science&filter=free-ebooks&orderBy=newest&startIndex=${page * 10}",
    );
    List<BookEntity> books = getBooksList(data);
    saveLocalBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({int page = 0}) async {
    final data = await apiService.get(
      endPoint: "volumes?q=art&filter=free-ebooks&startIndex=${page * 10}",
    );
    List<BookEntity> books = getBooksList(data);
    saveLocalBooksData(books, kSimilarBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    if (data["items"] != null) {
      for (var item in data["items"]) {
        print("📘 RAW ITEM: ${item["volumeInfo"]}");

        books.add(BookModel.fromJson(item));
      }
    }
    return books;
  }
}
