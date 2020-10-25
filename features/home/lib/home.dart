import 'package:bookmark/presentation/ui/favorite_news_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/presentation/ui/home_page.dart';
import 'package:list_news/data/remote/datasource/article_data_source.dart';
import 'package:list_news/data/remote/network/news_api.dart';
import 'package:list_news/data/repositories/news_repository_impl.dart';
import 'package:list_news/domain/repositories/news_repository.dart';
import 'package:list_news/domain/usecases/news_usecase.dart';
import 'package:list_news/presentation/bloc/bloc.dart';
import 'package:list_news/presentation/ui/list_news_page.dart';

class FeatureHomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => ListNewsPage()),
        Bind((_) => NewsApi(dio: Modular.get<Dio>())),
        Bind((_) =>
            NewsRepositoryImpl(dataSource: Modular.get<NewsDataSource>())),
        Bind((_) =>
            NewsUseCaseImpl(newsRepository: Modular.get<NewsRepository>())),
        Bind((_) => NewsBloc(newsUseCase: Modular.get<NewsUseCase>())),
        Bind((_) => FavoriteNewsPage()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          HomePage.routeName,
          child: (context, arg) => HomePage(),
        ),
      ];
}
