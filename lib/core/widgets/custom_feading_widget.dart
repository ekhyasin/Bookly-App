import 'package:flutter/material.dart';

class CustomFeadingWidget extends StatefulWidget {
  const CustomFeadingWidget({super.key, required this.child});

  final Widget child;

  @override
  State<CustomFeadingWidget> createState() => _CustomFeadingWidgetState();
}

class _CustomFeadingWidgetState extends State<CustomFeadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation animation;

  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation =
        Tween<double>(begin: 0.2, end: 0.8).animate(animationController);
    animationController.addListener(() {});
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
