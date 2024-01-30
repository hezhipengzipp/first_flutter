import 'package:flutter/material.dart';

import 'PageChild.dart';

class PageViewRoute extends StatelessWidget {
  const PageViewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 0; i < 6; i++) {
      children.add(PageChild(text: '$i'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView"),
      ),
      body: PageView(
          allowImplicitScrolling: true,
          scrollDirection: Axis.vertical,
          children: children),
    );
  }
}
