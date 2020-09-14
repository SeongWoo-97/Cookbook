import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      body: Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('아무 옵션이나 선택하십시오'),
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
    );
  }

  // SelectionScreen 을 띄우고 navigator.pop 으로부터 결과를 기다리는 메서드
  // context 를 매개변수로 받는 이유를 모름
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push 는 Future 를 반환합니다. Future 는 선택 창에서
    // Navigator.pop 이 호출된 이후 완료될 것입니다.
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectionScreen()));
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text('$result'),
      ));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('옵션을 고르시오'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('Yep!'),
                onPressed: () {
                  Navigator.pop(context, 'Yep!');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('Nope'),
                onPressed: () {
                  Navigator.pop(context, 'Nope!');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
