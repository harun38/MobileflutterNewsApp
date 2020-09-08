import 'package:flutter/material.dart';
import 'package:news_app/Model/ArticleModel.dart';
import 'package:news_app/Request/news.dart';

import 'ArticlePage.dart';
class CategoryPage extends StatefulWidget {
  final String category;
  CategoryPage({this.category});
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<ArticleModel> articles =new List<ArticleModel>();
  bool loading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();

  }
  getCategoryNews() async {
    CategoryNewsClass newsClass = new CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter", style: TextStyle(fontSize: 16),),
            Text(
              "News",
              style: TextStyle(color: Colors.blue,fontSize: 16),
            ),


          ],

        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40,right: 16),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("CreatedByHarun", style:TextStyle(fontStyle: FontStyle.italic, fontWeight:FontWeight.w600,color:Colors.black87),)
              ],
            ),
          )
        ],

        centerTitle: true,
        elevation: 0.0,
      ),
      body: loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              ///blogs
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context,index){
                      return BlogPage(
                        ImageSource: articles[index].urlToImage,
                        Title: articles[index].title,
                        Description: articles[index].description,
                        url: articles[index].url,

                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class BlogPage extends StatelessWidget {
  final String ImageSource, Title, Description, url;
  BlogPage({@required this.ImageSource, @required this.Title, @required this.Description, @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ArticlePage(
              BlogUrl: url,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(ImageSource)),
            SizedBox(height: 8,),
            Text(Title, style: TextStyle(
              color: Colors.black, fontSize: 16,
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(height: 8,),
            Text(Description, style: TextStyle(
                color: Colors.black45,fontSize: 12
            ),),
          ],

        ),
      ),
    );
  }
}

