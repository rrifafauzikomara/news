import 'package:core/database/database_module.dart';
import 'package:core/database/table/news_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'bookmark_dao.g.dart';

@UseDao(tables: [NewsTable])
class BookmarkDao extends DatabaseAccessor<AppDatabase>
    with _$BookmarkDaoMixin {
  BookmarkDao(AppDatabase db) : super(db);

  Future<List<NewsTableData>> getListBookmark() => select(newsTable).get();
}
