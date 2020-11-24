import 'package:bookmark/data/local/datasource/bookmark_data_source.dart';
import 'package:bookmark/data/repositories/bookmark_repository_impl.dart';
import 'package:bookmark/domain/repositories/bookmark_repository.dart';
import 'package:bookmark/domain/usecases/bookmark_usecase.dart';
import 'package:bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:core/database/database_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/presentation/ui/home_page.dart';
import 'package:list_news/data/remote/datasource/article_data_source.dart';
import 'package:list_news/data/remote/network/news_api.dart';
import 'package:list_news/data/repositories/news_repository_impl.dart';
import 'package:list_news/domain/repositories/news_repository.dart';
import 'package:list_news/domain/usecases/news_usecase.dart';
import 'package:list_news/presentation/bloc/bloc.dart';

class FeatureHomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => NewsApi(dio: Modular.get<Dio>())),
        Bind((_) =>
            NewsRepositoryImpl(dataSource: Modular.get<NewsDataSource>())),
        Bind((_) =>
            NewsUseCaseImpl(newsRepository: Modular.get<NewsRepository>())),
        Bind((_) => NewsBloc(newsUseCase: Modular.get<NewsUseCase>())),
        Bind((_) => BookmarkLocal(appDatabase: Modular.get<AppDatabase>())),
        Bind((_) => BookmarkRepositoryImpl(
            bookmarkDataSource: Modular.get<BookmarkDataSource>())),
        Bind((_) => BookmarkUseCaseImpl(
            bookmarkRepository: Modular.get<BookmarkRepository>())),
        Bind(
          (_) => BookmarkBloc(bookmarkUseCase: Modular.get<BookmarkUseCase>()),
          singleton: false,
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          HomePage.routeName,
          child: (context, arg) => HomePage(),
        ),
      ];
}
