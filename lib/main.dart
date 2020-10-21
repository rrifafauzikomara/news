import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/features/news/di/injection_container.dart' as di;
import 'package:news/core/bloc/news_bloc_observer.dart';
import 'package:news/features/detail/presentation/ui/detail_news_page.dart';
import 'package:news/features/home/presentation/ui/home_page.dart';
import 'package:news/shared/common/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = NewsBlocObserver();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This shared.widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: Themes.lightTheme,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        DetailNewsPage.routeName: (context) => DetailNewsPage(
              article: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}
