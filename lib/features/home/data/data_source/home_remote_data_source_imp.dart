// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app_with_clean_architecture/core/utilis/api_service.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImp(this.apiService);
  @override
  /// Fetches a list of featured books related to programming that are available as free ebooks.
  ///
  /// This method sends a GET request to the API endpoint with the query parameters
  /// for programming books and free ebooks filtering. It then parses the response
  /// data into a list of [BookEntity] objects.
  ///
  /// Returns a [Future] that completes with a list of [BookEntity]s.
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final data = await apiService.get(
      endPoint: "volumes?q=programming&Filtering=free-ebooks",
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  /// Fetches a list of the newest programming books available as free ebooks.
  ///
  /// This method sends a GET request to the API endpoint with query parameters
  /// that filter for programming books, restrict results to free ebooks, and sort
  /// them by newest first. The response data is then parsed into a list of
  /// [BookEntity] objects.
  ///
  /// Returns a [Future] that completes with a list of the newest [BookEntity]s.
  Future<List<BookEntity>> fetchNewestBooks() async {
    final data = await apiService.get(
      endPoint: "volumes?q=programming&Filtering=free-ebooks&sorting=newest",
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  /// Parses a list of book items from the provided API response data and returns a list of [BookEntity] objects.
  ///
  /// This function expects the [data] map to contain an "items" key, whose value is a list of book data maps.
  /// Each item in the list is converted into a [BookEntity] using [BookModel.fromJson].
  ///
  /// - [data]: The API response map containing a list of book items under the "items" key.
  ///
  /// Returns a list of [BookEntity] objects parsed from the input data.
  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data["items"]) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
