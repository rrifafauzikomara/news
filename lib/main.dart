import 'package:flutter/material.dart';
import 'package:news/common/themes.dart';
import 'package:news/ui/detail_news_page.dart';
import 'package:news/ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
