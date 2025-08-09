// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:bookly_app_with_clean_architecture/core/errors/failures.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/data_source/local_data_source/home_local_data_source.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var localData = homeLocalDataSource.fetchFeaturedBooks();
      if (localData.isNotEmpty) {
        return Right(localData);
      }
      var remoteData = await homeRemoteDataSource.fetchFeaturedBooks();
      return Right(remoteData);
    } catch (e) {
      return Left(Failures());
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var localData = homeLocalDataSource.fetchNewestBooks();
      if (localData.isNotEmpty) {
        return Right(localData);
      }
      var remoteData = await homeRemoteDataSource.fetchNewestBooks();
      return Right(remoteData);
    } catch (e) {
      return Left(Failures());
    }
  }
}
