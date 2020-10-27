import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/news/data/remote/network/news_api.dart';
import 'package:news/features/news/data/repositories/news_repository_impl.dart';
import 'package:news/features/news/domain/usecases/news_usecase.dart';
import 'package:news/features/news/presentation/bloc/bloc.dart';
import 'package:news/shared/widget/card_article.dart';
import 'package:news/shared/widget/news_header.dart';

class ListNewsPage extends StatelessWidget {
  final String title;

  const ListNewsPage({Key key, this.title}) : super(key: key);

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
      create: (context) => NewsBloc(
        newsUseCase: NewsUseCaseImpl(
          newsRepository: NewsRepositoryImpl(
            dataSource: NewsApi(),
          ),
        ),
      )..add(LoadData()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _buildList(),
      ),
    );
  }
}
