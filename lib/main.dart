import 'package:bloc/bloc.dart';
import 'package:bookmark/bookmark.dart';
import 'package:bookmark/presentation/ui/favorite_news_page.dart';
import 'package:core/core.dart';
import 'package:detail_news/detail_news.dart';
import 'package:detail_news/presentation/ui/detail_news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/home.dart';
import 'package:home/presentation/ui/home_page.dart';
import 'package:list_news/list_news.dart';
import 'package:list_news/presentation/ui/list_news_page.dart';
import 'package:news/bloc/news_bloc_observer.dart';
import 'package:shared/common/themes.dart';
import 'package:shared/shared.dart';

void main() async {
  Bloc.observer = NewsBlocObserver();
  Modular.init(CoreModule());
  Modular.init(SharedModule());
  runApp(ModularApp(module: AppModule()));
}

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  Widget get bootstrap => MyApp();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          HomePage.routeName,
          module: FeatureHomeModule(),
        ),
        ModularRouter(
          ListNewsPage.routeName,
          module: FeatureListNews(),
        ),
        ModularRouter(
          DetailNewsPage.routeName,
          module: FeatureDetailNews(),
        ),
        ModularRouter(
          FavoriteNewsPage.routeName,
          module: FeatureBookmarkModule(),
        ),
      ];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: Themes.lightTheme,
      initialRoute: HomePage.routeName,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
