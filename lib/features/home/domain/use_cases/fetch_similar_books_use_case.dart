import 'package:bookly_app_with_clean_architecture/core/errors/failures.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/similar_params.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase
    extends UseCase<List<BookEntity>, SimilarParams> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failures, List<BookEntity>>> call(SimilarParams params) async {
    return await homeRepo.fetchSimilarBooks(
      page: params.page,
      query: params.query,
    );
  }
}
