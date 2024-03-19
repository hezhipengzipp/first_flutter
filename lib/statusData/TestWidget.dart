import 'package:first_flutter/statusData/InheritShareData.dart';
import 'package:flutter/cupertino.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<StatefulWidget> createState() => TestState();
}

class TestState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return (Text(InheritShareData.of(context)!.data.toString()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies");
  }
}
