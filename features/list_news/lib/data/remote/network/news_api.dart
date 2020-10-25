import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:list_news/data/models/article_model.dart';
import 'package:list_news/data/remote/datasource/article_data_source.dart';

class NewsApi extends NewsDataSource {
  final Dio dio;

  NewsApi({@required this.dio});

  @override
  Future<ArticlesResultModel> getListArticle() async {
    try {
      Response response = await dio.get("/top-headlines", queryParameters: {
        "country": "id",
        "category": "business",
        "apiKey": "81d98da5c83d45a5ad24b6ab1698e745"
      });
      return ArticlesResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
