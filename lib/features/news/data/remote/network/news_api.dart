import 'package:dio/dio.dart';
import 'package:news/features/news/data/models/article_model.dart';
import 'package:news/features/news/data/remote/datasource/article_data_source.dart';

class NewsApi extends NewsDataSource {
  final String _endpoint = "http://newsapi.org/v2";
  final Dio _dio = Dio();

  @override
  Future<ArticlesResultModel> getListArticle() async {
    try {
      Response response =
          await _dio.get(_endpoint + "/top-headlines", queryParameters: {
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
