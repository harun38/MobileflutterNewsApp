import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/ArticleModel.dart';
import 'package:news_app/Model/CategoryModel.dart';
import 'package:news_app/Request/Data.dart';
import 'package:news_app/Request/news.dart';
import 'package:news_app/views/ArticlePage.dart';
import 'package:news_app/views/CategoriesPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories =new List<CategoryModel>();
  List<ArticleModel> articles =new List<ArticleModel>();
  bool loading=true;

  @override
  void initState() {
    super.initState();
    categories =getCategories();
    getNews();
  }
  getNews() async{
    News newsClass=new News();
    await newsClass.getNews();
    articles=newsClass.news;
    setState(() {
      loading=false;
    });
  }

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
          Container(
            margin: EdgeInsets.only(top: 16,right: 16),
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
      body:  loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[

                ///Categories
                Container(
                  height: 70,
                  child: ListView.builder(
                    itemCount: categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                      return CategoryCard(
                        ImageSource: categories[index].ImageSource,
                        CategoryName: categories[index].CategoryName,
                      );
                      }),

                ),
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
class CategoryCard extends StatelessWidget {
  final ImageSource, CategoryName;

  CategoryCard({this.ImageSource, this.CategoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> CategoryPage(
            category: CategoryName.toLowerCase(),
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 17),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: ImageSource,
                  width: 120, height: 60, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120, height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),

              child: Text(CategoryName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,
                  color: Colors.white),),

            )
          ],
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


