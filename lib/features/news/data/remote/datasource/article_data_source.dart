import 'package:news/features/news/data/models/article_model.dart';

abstract class NewsDataSource {
  Future<ArticlesResultModel> getListArticle();
}
