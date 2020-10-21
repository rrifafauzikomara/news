import 'package:dio/dio.dart';
import 'package:news/data/model/article.dart';

class ApiService {
  final String _endpoint = "http://newsapi.org/v2";
  final Dio _dio = Dio();

  Future<ArticlesResult> getListArticle() async {
    try {
      Response response =
          await _dio.get(_endpoint + "/top-headlines", queryParameters: {
        "country": "id",
        "category": "business",
        "apiKey": "81d98da5c83d45a5ad24b6ab1698e745"
      });
      return ArticlesResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
