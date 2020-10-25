import 'package:list_news/data/models/article_model.dart';

abstract class NewsDataSource {
  Future<ArticlesResultModel> getListArticle();
}
