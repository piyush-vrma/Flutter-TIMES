import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String articleUrl;
  ArticleView({this.articleUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  // This is a webViewController to complete the loading of the app screen
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  bool _loading = true;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 45,
              padding: EdgeInsets.only(left: 10),
              child: Image.asset(
                'images/hello.png',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'TOP NEWS',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.only(right: 60),
            ),
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: _loading
            ? SpinKitSquareCircle(
                color: Colors.lightBlueAccent,
                size: 50.0,
              )
            : WebView(
                initialUrl: widget.articleUrl,
                onWebViewCreated: ((webViewController) {
                  _completer.complete(webViewController);
                }),
              ),
      ),
    );
  }
}
