import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:images_study_app/Page/cached_image.dart';
import 'package:images_study_app/Page/display_from_internet.dart';
import 'package:images_study_app/Page/fade_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Image Demo')),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                RaisedButton(
                  child: Text('인터넷 에서 이미지 표시하기'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DisplayFromInternet()));
                  },
                ),
                RaisedButton(
                  child: Text('이미지 불러올때 Fade in 효과'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FadeIn()));
                  },
                ),
                RaisedButton(
                  child: Text('이미지 캐쉬 사용하기'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CachedImage()));
                  },
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

