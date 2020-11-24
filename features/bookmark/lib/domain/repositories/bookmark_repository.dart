import 'package:core/database/database_module.dart';

abstract class BookmarkRepository {
  Future<List<NewsTableData>> getListBookmark();
}
