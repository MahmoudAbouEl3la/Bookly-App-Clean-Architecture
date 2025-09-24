import 'package:bookly_app_with_clean_architecture/core/errors/failures.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/search/domain/repos/search_repos.dart';
import 'package:bookly_app_with_clean_architecture/features/search/domain/search_use_case/search_params.dart';
import 'package:bookly_app_with_clean_architecture/features/search/domain/search_use_case/search_use_case_with_param.dart';
import 'package:dartz/dartz.dart';

class FetchSearchBooksUseCase
    extends SearchUseCaseWithParam<List<BookEntity>, SearchParams> {
  final SearchRepos searchRepos;

  FetchSearchBooksUseCase(this.searchRepos);

  @override
  Future<Either<Failures, List<BookEntity>>> call(SearchParams params) {
    return searchRepos.fetchsearchBooks(query: params.query, page: params.page);
  }
}
