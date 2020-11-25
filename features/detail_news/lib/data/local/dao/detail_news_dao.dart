import 'package:core/database/database_module.dart';
import 'package:core/database/table/news_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'detail_news_dao.g.dart';

@UseDao(tables: [NewsTable])
class DetailNewsDao extends DatabaseAccessor<AppDatabase>
    with _$DetailNewsDaoMixin {
  DetailNewsDao(AppDatabase db) : super(db);

  Future saveNews(NewsTableData news) =>
      into(newsTable).insert(news, mode: InsertMode.insertOrReplace);

  Future deleteNews(NewsTableData news) => delete(newsTable).delete(news);

  Future<NewsTableData> getBookmarkedByUrl(String url) =>
      (select(newsTable)..where((tbl) => tbl.url.equals(url))).getSingle();
}
