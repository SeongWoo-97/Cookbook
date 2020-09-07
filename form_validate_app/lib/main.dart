import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Form Validation Demo'),
          ),
          body: MyCustomForm()),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Form 위젯을 식별할수 있고 Form 의 유호성을 확인할 GlobalKey 생성
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // 생성한 _formKey 를 Form 위젯에서 작성
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              // TextFormField 에 있는 값을 매개변수로 받아 조건문 검사
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              // _formKey 의 현재 상태를 검사
              if (_formKey.currentState.validate()) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
          )
        ],
      ),
    );
  }
}
