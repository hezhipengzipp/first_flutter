import 'package:flutter/material.dart';

class CustomScrollViewRoute extends StatelessWidget {
  const CustomScrollViewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var listView = SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text('$index')),
            childCount: 10),
        itemExtent: 50);

    return Scaffold(
      appBar: AppBar(title: const Text("CustomScrollView")),
      body: CustomScrollView(
        slivers: [listView, listView],
      ),
    );
  }
}
