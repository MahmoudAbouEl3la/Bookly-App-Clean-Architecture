import 'package:bookly_app_with_clean_architecture/core/errors/failures.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/no_params_use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends NoParamsUseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failures, List<BookEntity>>> call() async {
    return await homeRepo.fetchNewestBooks();
  }
}
