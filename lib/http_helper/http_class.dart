class NewsModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  NewsModel(
      {this.author, this.title, this.description, this.url, this.urlToImage});
  factory NewsModel.fromjson(final jsondata) {
    return NewsModel(
        author: jsondata['author'],
        title: jsondata['title'],
        description: jsondata['description'],
        url: jsondata['url'],
        urlToImage: jsondata['urlToimage']);
  }
}
