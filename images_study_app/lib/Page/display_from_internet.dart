import 'package:flutter/material.dart';

class DisplayFromInternet extends StatefulWidget {
  @override
  _DisplayFromInternetState createState() => _DisplayFromInternetState();
}

class _DisplayFromInternetState extends State<DisplayFromInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('인터넷에서 이미지 표시하기')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Image.network('https://picsum.photos/250?image=9'))
        ],
      ),
    );
  }
}
