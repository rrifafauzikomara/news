import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/database/database_module.dart';
import 'package:detail_news/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:list_news/domain/entities/article_entity.dart';

class DetailNewsPage extends StatelessWidget {
  static const routeName = '/detail_news_page';

  final ArticleEntity article;

  const DetailNewsPage({@required this.article});

  @override
  Widget build(BuildContext context) {
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
    return BlocProvider(
      create: (context) => Modular.get<DetailNewsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        floatingActionButton: BlocBuilder<DetailNewsBloc, DetailNewsState>(
          builder: (context, state) {
            return FloatingActionButton(
              child: Icon(Icons.favorite_border),
              onPressed: () =>
                  context.bloc<DetailNewsBloc>().add(SaveNews(data: data)),
            );
          },
        ),
        body: BlocListener<DetailNewsBloc, DetailNewsState>(
          listener: (context, state) {
            if (state is Success) {
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
          child: SingleChildScrollView(
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
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: 200.h,
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.description ?? "",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Divider(color: Colors.grey),
                      Text(
                        article.title ?? "",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Divider(color: Colors.grey),
                      Text(
                        'Date: ${article.publishedAt}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Author: ${article.author}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Divider(color: Colors.grey),
                      Text(
                        article.content ?? "",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
