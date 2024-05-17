import 'package:booklyapp/Features/home/data/data_source/home_local_data_source.dart';
import 'package:booklyapp/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:booklyapp/Features/home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/core/utilies/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
}

final getIt = GetIt.instance;