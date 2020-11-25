import 'package:core/database/database_module.dart';
import 'package:flutter/cupertino.dart';

abstract class DetailNewsDataSource {
  Future saveNews(NewsTableData news);

  Future deleteNews(NewsTableData news);

  Future<NewsTableData> getBookmarkedByUrl(String url);
}

class DetailNewsLocal extends DetailNewsDataSource {
  final AppDatabase appDatabase;

  DetailNewsLocal({@required this.appDatabase});

  @override
  Future deleteNews(NewsTableData news) =>
      appDatabase.detailNewsDao.deleteNews(news);

  @override
  Future saveNews(NewsTableData news) =>
      appDatabase.detailNewsDao.saveNews(news);

  @override
  Future<NewsTableData> getBookmarkedByUrl(String url) =>
      appDatabase.detailNewsDao.getBookmarkedByUrl(url);
}
