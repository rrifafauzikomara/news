import 'package:moor_flutter/moor_flutter.dart';

class NewsTable extends Table {
  TextColumn get url => text()();

  TextColumn get author => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get urlToImage => text()();

  TextColumn get publishedAt => text()();

  TextColumn get content => text()();

  BoolColumn get isBookmarked => boolean()();

  @override
  Set<Column> get primaryKey => {url};
}
