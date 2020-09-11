import 'package:flutter/material.dart';

class AnotherTypeList extends StatelessWidget {
  final items = List<ListItem>.generate(
    1000,
    (i) => i % 6 == 0
        ? HeadingItem("Heading $i")
        : MessageItem("Sender $i", "Message body $i"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Another Type List')),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            // is 키워드 : 타입 검사 키워드 ( bool 형태로 반환 )
            if (item is HeadingItem) {
              return ListTile(
                  title: Text(
                item.heading,
                style: Theme.of(context).textTheme.headline4,
              ));
            } else if (item is MessageItem) {
              return ListTile(
                title: Text(item.sender),
                subtitle: Text(item.body),
              );
            }
            return null;
          },
        ));
  }
}

// abstract 키워드 : 추상 클래스 선언
abstract class ListItem {}

// implements 키워드 : 추상 클래스를 사용하기 위해서는 일반 클래스에서 implements 사용
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
