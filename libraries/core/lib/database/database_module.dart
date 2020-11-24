import 'package:bookmark/data/local/dao/bookmark_dao.dart';
import 'package:core/database/table/news_table.dart';
import 'package:detail_news/data/local/dao/detail_news_dao.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database_module.g.dart';

@UseMoor(tables: [NewsTable], daos: [DetailNewsDao, BookmarkDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
