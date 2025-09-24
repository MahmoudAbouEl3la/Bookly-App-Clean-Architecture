import 'package:bookly_app_with_clean_architecture/core/errors/failures.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/search/data/data_source/remote_data_source_search/search_remote_data_source.dart';
import 'package:bookly_app_with_clean_architecture/features/search/domain/repos/search_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchReposImpl extends SearchRepos {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchReposImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failures, List<BookEntity>>> fetchsearchBooks({
    required String query,
    int page = 0,
  }) async {
    try {
      final books = await searchRemoteDataSource.fetchsearchBooks(
        page: page,
        query: query,
      );
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioError(e));
      }
      return Left(ServerFailures(message: e.toString()));
    }
  }
}
