import 'package:flutter/material.dart';
import 'package:news/features/news/domain/entities/article_entity.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';

abstract class NewsUseCase {
  Future<List<ArticleEntity>> getListArticle();
}

class NewsUseCaseImpl extends NewsUseCase {
  final NewsRepository newsRepository;

  NewsUseCaseImpl({@required this.newsRepository});

  @override
  Future<List<ArticleEntity>> getListArticle() =>
      newsRepository.getListArticle();
}