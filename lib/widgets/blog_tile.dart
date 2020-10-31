import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:noticias/views/article_view.dart';

class BlogTile extends StatefulWidget {
  final String imageUrl, title, description, articleUrl;

  BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.articleUrl});

  @override
  _BlogTileState createState() => _BlogTileState();
}

// ENUM for the tts state //
enum TtsState { playing, stopped }

class _BlogTileState extends State<BlogTile> {
  // Declaring flutter tts object

  FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;

  @override
  void initState() {
    initTts();
    super.initState();
  }

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        print("playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _speak() async {
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.9);
    await flutterTts.setPitch(1);
    await flutterTts.setLanguage('en-IN');

    if (widget.description != null) {
      if (widget.description.isNotEmpty) {
        var result = await flutterTts.speak(widget.description);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleView(
                      articleUrl: widget.articleUrl,
                    ),
                  ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(widget.imageUrl),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleView(
                              articleUrl: widget.articleUrl,
                            ),
                          ));
                    },
                    child: Column(
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () => _speak(),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.green[500],
                        size: 35,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () => _stop(),
                      child: Icon(
                        Icons.stop,
                        color: Colors.red[500],
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
