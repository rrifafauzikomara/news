import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/data/api/api_service.dart';
import 'package:news/data/bloc/news/bloc.dart';
import 'package:news/widget/card_article.dart';
import 'package:news/widget/news_header.dart';

class ListNewsPage extends StatelessWidget {
  final String title;

  const ListNewsPage({Key key, this.title}) : super(key: key);

  Widget _buildList() {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is HasData) {
          var articleNew = state.data.articles[0];
          var articleList = state.data.articles;
          articleList.removeAt(0);
          return NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                NewsHeader(article: articleNew),
              ];
            },
            body: ListView.separated(
              separatorBuilder: (context, index) => Divider(height: 2.h),
              shrinkWrap: true,
              itemCount: articleList.length,
              itemBuilder: (context, index) {
                return CardArticle(article: articleList[index]);
              },
            ),
          );
        } else if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is Error) {
          return Center(child: Text(state.message));
        } else if (state is NoData) {
          return Center(child: Text(state.message));
        } else if (state is NoInternetConnection) {
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
      create: (context) => NewsBloc(apiService: ApiService())..add(LoadData()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _buildList(),
      ),
    );
  }
}
