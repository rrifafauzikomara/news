import 'package:core/database/database_module.dart';
import 'package:detail_news/data/local/datasource/detail_news_data_source.dart';
import 'package:detail_news/domain/repositories/detail_news_repository.dart';
import 'package:flutter/material.dart';

class DetailNewsRepositoryImpl extends DetailNewsRepository {
  final DetailNewsDataSource dataSource;

  DetailNewsRepositoryImpl({@required this.dataSource});

  @override
  Future deleteNews(NewsTableData news) => dataSource.deleteNews(news);

  @override
  Future saveNews(NewsTableData news) => dataSource.saveNews(news);
}
