import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        channel: IOWebSocketChannel.connect('ws://echo.websocket.org'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final channel;

  MyHomePage({Key key, @required this.channel}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WebSocket Demo')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(labelText: '메세지 보내기'),
              ),
            ),
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    snapshot.hasData ? '받은메세지 : ${snapshot.data}' : '',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: '메시지 보내기',
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_textEditingController.text.isNotEmpty) {
      widget.channel.sink.add(_textEditingController.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.cloase();
    super.dispose();
  }
}
