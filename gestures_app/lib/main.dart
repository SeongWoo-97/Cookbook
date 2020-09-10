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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Gesture Demo')),
        body: Builder(builder: (BuildContext context) {
          return Column(
            children: [
              // InkWell 하위트리에 Tap 할 위젯을 작성합니다
              Center(
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Tap')));
                  },
                  child: Container(
                    child: Text('Container in InkWell'),
                    color: Colors.green,
                    padding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
              Container(
                height: 550,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Dismissible(
                      //각각의 Dismissible 에 Key 포함해야만 합니다
                        key: Key(item),
                        // 스와이프 된후에 App 에게 알려주는 프로퍼티
                        onDismissed: (direction) {
                          setState(() {
                            items.removeAt(index);
                          });
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("$item dismissed")));
                        },
                        // 스와이프 된후 빨간색 백그라운드 표시
                        background: Container(color: Colors.red),
                        child: ListTile(title: Text('${items[index]}')));
                  },
                ),
              )
            ],
          );
        }));
  }
}
