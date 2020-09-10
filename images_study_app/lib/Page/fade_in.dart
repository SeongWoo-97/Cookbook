import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeIn extends StatefulWidget {
  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fade In 효과')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(16.0),
              child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: 'https://picsum.photos/250?image=9'))
        ],
      ),
    );
  }
}
