import 'package:news/features/news/domain/entities/article_entity.dart';

abstract class NewsRepository {
  Future<List<ArticleEntity>> getListArticle();
}
