import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget {
  final String text;

  const TipRoute({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    const list = ['apples', 'bananas', 'oranges'];
    list.map((item) => item.toUpperCase()).forEach((item) {
      debugPrint('$item: ${item.length}');
    });
    Widget redBox =
        const DecoratedBox(decoration: BoxDecoration(color: Colors.red));
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, "我是返回值"),
                  child: const Text("点击返回")),
              ConstrainedBox(
                constraints:
                    const BoxConstraints(minHeight: 100.0, minWidth: 50),
                child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: 100, minHeight: 50),
                    child: SizedBox(
                      height: 5,
                      child: redBox,
                    )),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: redBox,
              ),
              Container(
                color: Colors.blue.shade50,
                child: const Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
