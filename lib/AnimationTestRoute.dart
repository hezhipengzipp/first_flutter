import 'package:flutter/cupertino.dart';

class AnimationTestRoute extends StatefulWidget {
  const AnimationTestRoute({super.key});

  @override
  State<StatefulWidget> createState() => ScaleAnimationState();
}

class ScaleAnimationState extends State<AnimationTestRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = Tween(begin: 0.0, end: 300.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return (Center(
      child: Image(
          image: const AssetImage("/images/icon_cause_sleep_bioalarm.png"),
          height: animation.value,
          width: animation.value),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
