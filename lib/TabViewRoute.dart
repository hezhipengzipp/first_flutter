import 'package:flutter/material.dart';

class TabViewRoute extends StatefulWidget {
  const TabViewRoute({super.key});

  @override
  State<StatefulWidget> createState() => TabViewRouteState();
}

class TabViewRouteState extends State<TabViewRoute>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["新闻", "体育", "视频", "财经"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("TabView"),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    ));
  }
}
