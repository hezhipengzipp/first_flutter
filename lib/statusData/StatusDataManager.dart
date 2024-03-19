import 'package:first_flutter/statusData/InheritShareData.dart';
import 'package:first_flutter/statusData/TestWidget.dart';
import 'package:flutter/material.dart';

class StatusDataManager extends StatefulWidget {
  const StatusDataManager({super.key});

  @override
  State<StatefulWidget> createState() => StatusDataState();
}

class StatusDataState extends State<StatusDataManager> {
  int coute = 0;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("数据状态管理"),
      ),
      body: Center(
        child: InheritShareData(
          coute,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TestWidget(),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ++coute;
                    });
                  },
                  child: const Text("Increment"))
            ],
          ),
        ),
      ),
    ));
  }
}
