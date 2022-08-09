import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_refresh/models/NewsResponse.dart';
import 'package:news_refresh/models/SourcesResponse.dart';

class ApiManeger {
  static const String basUrl = "newsapi.org";

  static Future<SourcesResponse> getSources(String cat) async {
    var url = Uri.https(basUrl, "/v2/top-headlines/sources",
        {"apiKey": "e1cac4dcf9ec4f4c8cd4fc3a6c92a0c2", "category": cat});
    var response = await http.get(url);
    try {
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getNews(
      {String? source, String? serchQuery, int page = 1}) async {
    var url = Uri.https(basUrl, "/v2/everything", {
      "apiKey": "e1cac4dcf9ec4f4c8cd4fc3a6c92a0c2",
      "sources": source,
      "q": serchQuery,
      "page": "$page"
    });
    var response = await http.get(url);
    try {
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      NewsResponse newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (e) {
      throw (e);
    }
  }
}
