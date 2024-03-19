import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final List<Color>? colors;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final GestureTapCallback? gestureTapCallback;
  final Widget child;

  const GradientButton(
      {super.key,
      this.colors,
      this.height,
      this.width,
      this.borderRadius,
      this.gestureTapCallback,
      required this.child});

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    List<Color> _colors =
        colors ?? [themeData.primaryColor, themeData.primaryColorDark];
    return (DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: _colors),
          borderRadius: borderRadius),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: gestureTapCallback,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  child: child),
            )),
          ),
        ),
      ),
    ));
  }
}
