import 'package:bookly_app_with_clean_architecture/core/utilis/api_service.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/data_source/local_data_source/home_local_data_source_impl.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/data_source/remote_data_source/home_remote_data_source_impl.dart';
import 'package:bookly_app_with_clean_architecture/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImp(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
}
