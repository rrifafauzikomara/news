import 'package:core/database/database_module.dart';

abstract class DetailNewsRepository {
  Future saveNews(NewsTableData news);

  Future deleteNews(NewsTableData news);
}
