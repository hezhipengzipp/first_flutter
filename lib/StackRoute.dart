import 'package:flutter/material.dart';

class StackRoutePage extends StatelessWidget {
  const StackRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StackRoute"),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: Text("Hello world", style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            const Positioned(left: 18, child: Text("我是Jack")),
            const Positioned(top: 30, child: Text("Android")),
            const Positioned(
                top: 50,
                child: Icon(
                  Icons.search,
                )),
          ],
        ),
      ),
    );
  }
}
