import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/data/api/api_service.dart';
import 'package:news/data/model/article.dart';
import 'package:news/widget/card_article.dart';
import 'package:news/widget/news_header.dart';

class ListNewsPage extends StatefulWidget {
  final String title;

  const ListNewsPage({Key key, this.title}) : super(key: key);

  @override
  _ListNewsPageState createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  Future<ArticlesResult> _article;

  @override
  void initState() {
    super.initState();
    _article = ApiService().getListArticle();
  }

  Widget _buildList() {
    return FutureBuilder(
      future: _article,
      builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            var article = snapshot.data.articles;
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
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Text('');
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildList(),
    );
  }
}
