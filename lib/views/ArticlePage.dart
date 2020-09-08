import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticlePage extends StatefulWidget {
  final String BlogUrl;
  ArticlePage({this.BlogUrl});
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final Completer<WebViewController> completer= Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Flutter"),
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          actions: <Widget>[
            Opacity(
              opacity: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.save)),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
       body: Container(
         height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: WebView(
            initialUrl:widget.BlogUrl ,
            onWebViewCreated: ((WebViewController webViewController){
              completer.complete(webViewController);
            }),
          ),
        )
    ) ;
  }
}
