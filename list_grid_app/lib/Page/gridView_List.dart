import 'package:flutter/material.dart';

class GridViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView List')),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) => Center(
          child: Text('Item $index',style: Theme.of(context).textTheme.headline6,),
        )),
      ),
    );
  }
}
