class ArticlesResult {
  ArticlesResult({this.articles});

  List<Article> articles;

  factory ArticlesResult.fromJson(Map<String, dynamic> json) => ArticlesResult(
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"] == null ? null : json["content"],
      );
}
