import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  const WillPopScopeTestRoute({super.key});

  @override
  State<StatefulWidget> createState() => _WillPopScopeState();
}

class _WillPopScopeState extends State<WillPopScopeTestRoute> {
  int isCanQuit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PopScopeState")),
      body: PopScope(
          canPop: isCanQuit >= 3,
          onPopInvoked: (bool didup) {
            debugPrint("isCanQuit= ${didup}");
            if (!didup) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("再按一次退出")));
              return;
            }
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                TextButton(
                  child: const Text("点击三次才能返回"),
                  onPressed: () {
                    setState(() {
                      ++isCanQuit;
                    });
                  },
                ),
              ],
            ),
          )),
    );
  }
}
