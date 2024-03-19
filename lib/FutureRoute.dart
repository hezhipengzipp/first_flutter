
import 'package:flutter/material.dart';

class FutureRoute extends StatelessWidget {
  const FutureRoute({super.key});

  Future<String> mockNetworkData() async {
    return Future.delayed(const Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  @override
  Widget build(BuildContext context) {
    Future<bool?> showDeleteConfirmDialog() {
      return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("您确定要删除当前文件吗?"),
            actions: <Widget>[
              TextButton(
                child: const Text("取消"),
                onPressed: () => Navigator.of(context).pop(), // 关闭对话框
              ),
              TextButton(
                child: const Text("删除"),
                onPressed: () {
                  //关闭对话框并返回true
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }

    return (Scaffold(
      appBar: AppBar(
        title: const Text("异步操作流"),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
                future: mockNetworkData(),
                builder: (BuildContext buildContext, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return (Text("Error: ${snapshot.error}"));
                    } else {
                      return (Text("response: ${snapshot.data}"));
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
            ElevatedButton(
                onPressed: () async {
                  bool? delete = await showDeleteConfirmDialog();
                  if (delete == null) {
                    debugPrint("点击了阴影关闭");
                  } else {
                    debugPrint("已确认删除");
                  }
                },
                child: const Text("打开对话框"))
          ],
        ),
      ),
    ));
  }
}
