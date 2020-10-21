import 'package:get_it/get_it.dart';
import 'package:news/core/network/dio_client.dart';
import 'package:news/features/news/data/remote/datasource/article_data_source.dart';
import 'package:news/features/news/data/remote/network/news_api.dart';
import 'package:news/features/news/data/repositories/news_repository_impl.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';
import 'package:news/features/news/domain/usecases/news_usecase.dart';
import 'package:news/features/news/presentation/bloc/news_bloc.dart';

final inject = GetIt.instance;

Future<void> init() async {
  // Bloc
  inject.registerFactory(
    () => NewsBloc(newsUseCase: inject()),
  );

  // Use cases
  inject.registerLazySingleton<NewsUseCase>(
      () => NewsUseCaseImpl(newsRepository: inject()));

  // Repository
  inject.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(dataSource: inject()),
  );

  // Data sources
  inject.registerLazySingleton<NewsDataSource>(
    () => NewsApi(dio: inject()),
  );

  //! Core
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton(
      () => DioClient(apiBaseUrl: "http://newsapi.org/v2"));
}
