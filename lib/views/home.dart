import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noticias/networking_data/news.dart';
import 'package:noticias/models/article_model.dart';
import 'package:noticias/models/category_model.dart';
import 'package:noticias/networking_data/data.dart';
import 'package:noticias/widgets/category_tile.dart';
import 'package:noticias/widgets/blog_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoryList = [];
  List<ArticleModel> articalList = [];
  bool _loading = true;

  @override
  void initState() {
    categoryList = getCategoryList();
    getArticalList();
    super.initState();
  }

  void getArticalList() async {
    articalList = await News().getNews();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 45,
              padding: EdgeInsets.only(left: 10),
              child: Image.asset(
                'images/mob.png',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Flutter TIMES',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Column(
                children: [
                  //  Category List  //
                  Container(
                    height: 90,
                    child: ListView.builder(
                      itemCount: categoryList.length,
                      shrinkWrap:
                          true, // Whenever using in a column use a shrinkwrap
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var category = categoryList[index];
                        return CategoryTile(
                          imageUrl: category.imageUrl,
                          categoryName: category.categoryName,
                        );
                      },
                    ),
                  ),

                  // Blog List //
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
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
                  ),
                ],
              ),
            ),
    );
  }
}
