import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/database/database_module.dart';
import 'package:detail_news/presentation/bloc/bookmarked/bloc.dart';
import 'package:detail_news/presentation/bloc/detail_news/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:list_news/domain/entities/article_entity.dart';

class DetailNewsPage extends StatelessWidget {
  static const routeName = '/detail_news_page';

  final ArticleEntity article;

  const DetailNewsPage({@required this.article});

  Widget _buildFloating(
      BuildContext context, BookmarkedState state, NewsTableData data) {
    if (state.isBookmarked) {
      return BlocBuilder<DetailNewsBloc, DetailNewsState>(
        builder: (context, state) {
          return FloatingActionButton(
            child: Icon(Icons.favorite),
            backgroundColor: Colors.pinkAccent,
            onPressed: () =>
                context.bloc<DetailNewsBloc>().add(DeleteNews(data: data)),
          );
        },
      );
    } else {
      return BlocBuilder<DetailNewsBloc, DetailNewsState>(
        builder: (context, state) {
          return FloatingActionButton(
            child: Icon(Icons.favorite_border),
            backgroundColor: Colors.pinkAccent,
            onPressed: () =>
                context.bloc<DetailNewsBloc>().add(SaveNews(data: data)),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Modular.get<BookmarkedBloc>().add(GetBookmarked(url: article.url));
    final data = NewsTableData(
      author: article.author,
      title: article.title,
      description: article.description,
      url: article.url,
      urlToImage: article.urlToImage,
      publishedAt: article.publishedAt,
      content: article.content,
      isBookmarked: true,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('News App'),
      ),
      floatingActionButton: BlocBuilder<BookmarkedBloc, BookmarkedState>(
        builder: (context, state) => _buildFloating(context, state, data),
      ),
      body: BlocListener<DetailNewsBloc, DetailNewsState>(
        listener: (context, state) {
          if (state is Success) {
            Modular.get<BookmarkedBloc>().add(GetBookmarked(url: article.url));
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (state is Error) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        child: Column(
          children: [
            article.urlToImage == null
                ? Container(
                    height: 200.h,
                    child: Icon(Icons.error),
                  )
                : Hero(
                    tag: article.urlToImage,
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage,
                      placeholder: (context, url) => Container(
                        height: 200.h,
                        child: Center(
                          child: SpinKitFadingCircle(
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color:
                                      index.isEven ? Colors.red : Colors.green,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 200.h,
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        article.title ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date: ${article.publishedAt}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Author: ${article.author}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey),
                      Text(
                        article.content ?? "",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}