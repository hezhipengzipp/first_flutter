import 'package:flutter/cupertino.dart';

class InheritShareData extends InheritedWidget {
  final int data;

  const InheritShareData(this.data, {super.key, required super.child});

  static InheritShareData? of(BuildContext buildContext) {
    return buildContext.dependOnInheritedWidgetOfExactType<InheritShareData>();
  }

  @override
  bool updateShouldNotify(InheritShareData oldWidget) {
    return oldWidget.data != data;
  }
}
