import 'dart:convert';

import 'package:news_app/Model/ArticleModel.dart';
import 'package:http/http.dart'as http;
class News  {
  List<ArticleModel> news =[];

  Future<void> getNews() async{
    String url="http://newsapi.org/v2/top-headlines?country=tr&apiKey=7be394e1101a40c09dc541f56ab75448";
    var response= await http.get(url);
    var jsonData=json.decode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element['description']!=null) {
          ArticleModel articleModel= ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content']
          );
          news.add(articleModel);
        }
      });
    }
  }
}
class CategoryNewsClass{
  List<ArticleModel> news =[];

  Future<void> getNews(String category) async{
    String url="http://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=7be394e1101a40c09dc541f56ab75448";
    var response= await http.get(url);
    var jsonData=json.decode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element['description']!=null) {
          ArticleModel articleModel= ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']
          );
          news.add(articleModel);
        }
      });
    }
  }
}