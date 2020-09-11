import 'package:flutter/material.dart';
import 'package:list_grid_app/Page/another_type_list.dart';
import 'package:list_grid_app/Page/gridView_List.dart';
import 'package:list_grid_app/Page/horizontal_List.dart';

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
        appBar: AppBar(title: Text('Grid List Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RaisedButton(
                child: Text('GridView List'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GridViewList()));
                },
              ),
              RaisedButton(
                child: Text('수평으로 동작하는 List'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HorizontalList()));
                },
              ),
              RaisedButton(
                child: Text('다른 타입의 항목을 사용한 List'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnotherTypeList()));
                },
              ),
            ],
          ),
        ));
  }
}
