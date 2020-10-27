import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_news/presentation/bloc/bloc.dart';
import 'package:shared/widget/card_article.dart';
import 'package:shared/widget/news_header.dart';

class ListNewsPage extends StatelessWidget {
  static const routeName = "/list_news";

  Widget _buildList() {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is HasData) {
          var article = state.data;
          return NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                NewsHeader(article: article[0]),
              ];
            },
            body: ListView.separated(
              separatorBuilder: (context, index) => Divider(height: 2.h),
              shrinkWrap: true,
              itemCount: article.length,
              itemBuilder: (context, index) {
                return CardArticle(article: article[index]);
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
      create: (context) => Modular.get<NewsBloc>()..add(LoadData()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: _buildList(),
      ),
    );
  }
}
