// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:bookly_app_with_clean_architecture/core/errors/failures.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/use_cases/no_params_use_case.dart';

class FetchFeaturedBooksUseCases extends NoParamsUseCase<List<BookEntity>> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCases({required this.homeRepo});
  @override
  Future<Either<Failures, List<BookEntity>>> call() async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
