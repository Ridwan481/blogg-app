import 'dart:convert';

import 'package:blog/http_helper/http_class.dart';
import 'package:http/http.dart' as http;

class News {
  List<NewsModel> news = [];

  Future<void> getnews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=ng&apiKey=1aaa3054cb764b4797e19c40f637cb73';

    final respond = await http.get(url);
    final json = jsonDecode(respond.body);
    if (json['status'] == 'ok') {
      json["articles"].forEach((elemant) {
        if (elemant["urlToImage"] != null && elemant['description'] != null) {
          NewsModel _newsModel = NewsModel(
              author: json['author'],
              title: json['title'],
              description: json['description'],
              url: json['url'],
              urlToImage: json['urlToimage']);
          news.add(_newsModel);
        }
      });
    }
  }
}
