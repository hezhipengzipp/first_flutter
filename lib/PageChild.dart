import 'package:flutter/cupertino.dart';

class PageChild extends StatefulWidget {
  const PageChild({super.key, required this.text});

  final String text;

  @override
  State<StatefulWidget> createState() {
    return _PageViewState();
  }
}

class _PageViewState extends State<PageChild>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    debugPrint("index = ${widget.text}");
    return Center(
      child: Text(widget.text, textScaleFactor: 5),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
