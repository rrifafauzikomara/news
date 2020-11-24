import 'package:bookmark/data/local/datasource/bookmark_data_source.dart';
import 'package:bookmark/domain/repositories/bookmark_repository.dart';
import 'package:core/database/database_module.dart';
import 'package:flutter/cupertino.dart';

class BookmarkRepositoryImpl extends BookmarkRepository {
  final BookmarkDataSource bookmarkDataSource;

  BookmarkRepositoryImpl({@required this.bookmarkDataSource});

  @override
  Future<List<NewsTableData>> getListBookmark() =>
      bookmarkDataSource.getListBookmark();
}
