import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold 에 Appbar 를 추가하지 않습니다. body 만 있습니다
      // customScrollView 에서 Appbar 추가예정
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Floating App Bar'),
            // 사용자가 항목 리스트를 위로 다시 돌아오기 시작할때 AppBar 를 표시할수 있음
            floating: true,
            flexibleSpace: Placeholder(),
            expandedHeight: 200,
          ),
          //SliverList 추가
          SliverList(
            // 사용자들이 화면 스크롤을 내릴때 항목들을 delegate 를 사용하여 항목을 작성
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 100,
            ),
          )
        ],
      ),
    );
  }
}
