import 'package:flutter/material.dart';

import 'PageChild.dart';

class PageViewRoute extends StatefulWidget {
  const PageViewRoute({super.key});

  @override
  State<StatefulWidget> createState() => _PageViewRouteState();
}

class _PageViewRouteState extends State<PageViewRoute> {
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 0; i < 6; i++) {
      children.add(PageChild(text: '$i'));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("PageView"),
          centerTitle: true,
        ),
        body: PageView(
            controller: pageController,
            onPageChanged: (int index) {
              debugPrint('currentIndex = $index');
              setState(() {
                currentPageIndex = index;
              });
            },
            allowImplicitScrolling: true,
            scrollDirection: Axis.horizontal,
            children: children),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  debugPrint('currentIndex  arrow_back= $currentPageIndex');
                  if (currentPageIndex > 0) {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  debugPrint(
                      'currentIndex  currentPageIndex= $currentPageIndex');
                  if (currentPageIndex < 5) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
