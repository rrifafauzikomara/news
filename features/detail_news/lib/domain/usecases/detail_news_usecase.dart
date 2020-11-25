import 'package:core/database/database_module.dart';
import 'package:detail_news/domain/repositories/detail_news_repository.dart';
import 'package:flutter/material.dart';

abstract class DetailNewsUseCase {
  Future saveNews(NewsTableData news);

  Future deleteNews(NewsTableData news);

  Future<NewsTableData> getBookmarkedByUrl(String url);
}

class DetailNewsUseCaseImpl extends DetailNewsUseCase {
  final DetailNewsRepository newsRepository;

  DetailNewsUseCaseImpl({@required this.newsRepository});

  @override
  Future deleteNews(NewsTableData news) => newsRepository.deleteNews(news);

  @override
  Future saveNews(NewsTableData news) => newsRepository.saveNews(news);

  @override
  Future<NewsTableData> getBookmarkedByUrl(String url) =>
      newsRepository.getBookmarkedByUrl(url);
}
