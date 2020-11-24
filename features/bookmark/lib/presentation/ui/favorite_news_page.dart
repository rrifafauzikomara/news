import 'package:bookmark/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_news/domain/entities/article_entity.dart';
import 'package:shared/widget/card_article.dart';

class FavoriteNewsPage extends StatelessWidget {
  static const routeName = "/favorite";

  Widget _buildList() {
    return BlocBuilder<BookmarkBloc, BookmarkState>(
      builder: (context, state) {
        if (state is HasData) {
          final article = List<ArticleEntity>();
          state.data.forEach((data) {
            final news = ArticleEntity(
              author: data.author,
              title: data.title,
              description: data.description,
              url: data.url,
              urlToImage: data.urlToImage,
              publishedAt: data.publishedAt,
              content: data.content,
            );
            article.add(news);
          });
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 2.h),
            shrinkWrap: true,
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return CardArticle(article: article[index]);
            },
          );
        } else if (state is Error) {
          return Center(child: Text(state.message));
        } else if (state is NoData) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(""));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<BookmarkBloc>()..add(LoadBookmark()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
        ),
        body: _buildList(),
      ),
    );
  }
}
