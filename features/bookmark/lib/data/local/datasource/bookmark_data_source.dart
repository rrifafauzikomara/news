import 'package:core/database/database_module.dart';
import 'package:flutter/cupertino.dart';

abstract class BookmarkDataSource {
  Future<List<NewsTableData>> getListBookmark();
}

class BookmarkLocal extends BookmarkDataSource {
  final AppDatabase appDatabase;

  BookmarkLocal({@required this.appDatabase});

  @override
  Future<List<NewsTableData>> getListBookmark() =>
      appDatabase.bookmarkDao.getListBookmark();
}
