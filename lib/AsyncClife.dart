import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class AsyncClifeRoute extends StatefulWidget {
  const AsyncClifeRoute({super.key});

  @override
  State<StatefulWidget> createState() => _AsyncClifeState();
}

class _AsyncClifeState extends State<AsyncClifeRoute> {
  String text = "事件未开始";
  String jsonText = "json数据";

  Future<String> _getNetData() async {
    final netdata = await File("netData.json").readAsString(encoding: utf8);
    setState(() {
      jsonText = netdata;
    });
    return netdata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AsyncClife"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  setState(() {
                    text = "开始延迟延迟执行";
                  });
                  Future.delayed(const Duration(seconds: 10), () {
                    setState(() {
                      text = "事件延迟10s已结束了";
                    });
                  });
                },
                child: const Text("开始长时间异步")),
            Text(text),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "form_route");
                },
                child: const Text("点击跳转")),
            TextButton(
                onPressed: () {
                  debugPrint('42'.padLeft(5,'A'));
                },
                child: const Text("开始padLeft")),
            Text(jsonText)
          ],
        ),
      ),
    );
  }
}
