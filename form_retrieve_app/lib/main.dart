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
  // TextEditingController 를 선언하고 TextField 에 있는 현재 값을 가져올수 있음
  final textController = TextEditingController();
  @override
  void dispose() {
    // 위젯이 종료 될때 컨트롤러를 종료
    textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Retrieve Text Input')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          // 컨트롤러 프로퍼티에 선언한 변수 작성
          controller: textController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.text_fields),
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(textController.text),
              );
            }
          );
        },
      )
    );
  }
}
