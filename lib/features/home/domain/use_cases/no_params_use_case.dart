import 'package:bookly_app_with_clean_architecture/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NoParamsUseCase<Type> {
  Future<Either<Failures, Type>> call();
}
