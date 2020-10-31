import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noticias/networking_data/news.dart';
import 'package:noticias/models/article_model.dart';
import 'package:noticias/widgets/blog_tile.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articalList = List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    getArticalList();
    super.initState();
  }

  void getArticalList() async {
    articalList = await CategoryNewsClass().getNews(widget.category);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'TOP ${widget.category.toUpperCase()} NEWS',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: SpinKitSquareCircle(
                  color: Colors.lightBlueAccent,
                  size: 50.0,
                ),
              ),
            )
          : Container(
              //  BlogTile Container
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: articalList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var article = articalList[
                      index]; // Artical present in the particular index of the artical list;
                  return BlogTile(
                    title: article.title,
                    imageUrl: article.urlToImage,
                    description: article.description,
                    articleUrl: article.url,
                  );
                },
              ),
            ),
    );
  }
}
