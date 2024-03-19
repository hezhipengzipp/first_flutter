import 'package:first_flutter/combination/GradientButton.dart';
import 'package:flutter/material.dart';

class GradientPage extends StatelessWidget {
  const GradientPage({super.key});

  @override
  Widget build(BuildContext context) {
    onTap() {
      debugPrint("button click");
    }

    return (Scaffold(
      appBar: AppBar(title: const Text("渐变组合控件")),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientButton(
            gestureTapCallback: onTap,
            height: 50,
            colors: const [Colors.orange, Colors.red],
            child: const Text("submit"),
          ),
          GradientButton(
            gestureTapCallback: onTap,
            height: 50,
            colors: const [Colors.lightBlue, Colors.yellow],
            child: const Text("submit"),
          ),
          GradientButton(
            gestureTapCallback: onTap,
            height: 50,
            colors: const [Colors.lightGreen, Colors.blueAccent],
            child: const Text("submit"),
          ),
        ],
      ),
    ));
  }
}
