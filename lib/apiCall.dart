import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:news/newsModel.dart';

class ApiCall {
  Future<List<NewsModel>> getNews() async {
    List<NewsModel> news = <NewsModel>[];
    //List<NewsModel> newss = <NewsModel>[];
    Uri url = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&apiKey=3d358e1e8a2e46f798d439ae6be556e1");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("Success");
      var data = jsonDecode(response.body);
      data["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsModel article = NewsModel(
            desc: element['description'],
            image: element['urlToImage'],
            name: element['title'],
            url: element["url"],
          );
          news.add(article);
        }
      });
      return news;
    }
    throw response.statusCode;
  }
}
