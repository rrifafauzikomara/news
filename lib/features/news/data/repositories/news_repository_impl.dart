import 'package:flutter/cupertino.dart';
import 'package:news/features/news/data/remote/datasource/article_data_source.dart';
import 'package:news/features/news/domain/entities/article_entity.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsDataSource dataSource;

  NewsRepositoryImpl({@required this.dataSource});

  @override
  Future<List<ArticleEntity>> getListArticle() async {
    List<ArticleEntity> articleEntity = List<ArticleEntity>();
    var article = await dataSource.getListArticle();
    article.articles.forEach((data) {
      var news = ArticleEntity(
        author: data.author,
        title: data.title,
        description: data.description,
        url: data.url,
        urlToImage: data.urlToImage,
        publishedAt: data.publishedAt,
        content: data.content,
      );
      articleEntity.add(news);
    });
    return articleEntity;
  }
}
