import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CachedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('이미지 캐쉬 사용하기')),
      body: Center(
        child: CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl:
          'https://picsum.photos/250?image=9',
        ),
      ),
    );
  }
}
