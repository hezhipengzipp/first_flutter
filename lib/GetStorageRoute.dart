import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageRoute extends StatefulWidget {
  const GetStorageRoute({super.key});

  @override
  State<StatefulWidget> createState() => _GetStorState();
}

class _GetStorState extends State<GetStorageRoute> {
  String text = "";
  final GetStorage getStorage = GetStorage();

  _GetStorState() {
    getStorage.listen(() {
      debugPrint("值收到变化了");
    });

    getStorage.listenKey("Flutter_Android", (value) {
      debugPrint("值收到变化了= $value");
    });
  }

  void saveHello(String value) {
    getStorage.write("Flutter_Android", value);
  }

  void getHello() {
    var value = getStorage.read("Flutter_Android");
    setState(() {
      text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("get_storage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("data"),
            ElevatedButton(
                onPressed: () => saveHello("get_storage"),
                child: const Text("点击设置getStorage存储")),
            ElevatedButton(
                onPressed: () => getHello(),
                child: const Text("点击获取getStorage存储")),
            Text(text)
          ],
        ),
      ),
    );
  }
}
