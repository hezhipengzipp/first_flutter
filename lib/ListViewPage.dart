import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  ScrollControllerState createState() {
    return ScrollControllerState();
  }
}

class ScrollControllerState extends State<ListViewPage> {
  final ScrollController _scrollController = ScrollController();
  bool isShowFloatActionBut = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      debugPrint('当前位置 = ${_scrollController.offset}');
      if (_scrollController.offset < 1000 && isShowFloatActionBut) {
        setState(() {
          isShowFloatActionBut = false;
        });
      } else if (_scrollController.offset >= 1000 && !isShowFloatActionBut) {
        setState(() {
          isShowFloatActionBut = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动控制"),
      ),
      body: Scrollbar(
          child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: 100,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 100,
                  child: Center(
                    child: Text('Entry $index'),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              })),
      floatingActionButton: !isShowFloatActionBut
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              }),
    );
  }
}
