import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('수평으로 동작하는 List')),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200,
        child: ListView(
          // 스크롤 방향 설정 프로퍼티
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 150,
              color: Colors.red,
            ),
            Container(
              width: 150,
              color: Colors.blue,
            ),
            Container(
              width: 150,
              color: Colors.green,
            ),
            Container(
              width: 150,
              color: Colors.yellow,
            ),
            Container(
              width: 150,
              color: Colors.pink,
            ),
            Container(
              width: 150,
              color: Colors.black,
            ),
          ],
        ),
      )
    );
  }
}
