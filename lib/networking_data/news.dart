import 'dart:convert';
import 'package:noticias/models/article_model.dart';
import 'package:http/http.dart' as http;

// All the networking related data is here

class News {
  // This is a function which return list of article (news);
  Future<List<ArticleModel>> getNews() async {
    List<ArticleModel> news = [];
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&apiKey=88bf6dd05bab49ad83f3c67badd5c3f7';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            // publishedAt: element['publishedAt'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
    return news;
  }
}

class CategoryNewsClass {
  // This is a function which return list of article (news);
  Future<List<ArticleModel>> getNews(String category) async {
    List<ArticleModel> news = [];
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=88bf6dd05bab49ad83f3c67badd5c3f7';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            // publishedAt: element['publishedAt'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
    return news;
  }
}
