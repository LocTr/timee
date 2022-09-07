import 'package:flutter/material.dart';

import 'progress_arc.dart';

class AnimatedProgressArcController {
  late void Function() start;
  late void Function() pause;
}

class AnimatedProgressArc extends StatefulWidget {
  const AnimatedProgressArc(
      {Key? key,
      required this.controller,
      required this.size,
      required this.strokeWidth})
      : super(key: key);

  final AnimatedProgressArcController controller;
  final double size;
  final double strokeWidth;

  @override
  State<AnimatedProgressArc> createState() => _AnimatedProgressArcState();
}

class _AnimatedProgressArcState extends State<AnimatedProgressArc>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    // this create the same effect
    // _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // No need this because this widget render an AnimatedWidget which doesnt need
    // to setState when animate
    // Tween(begin: 0.0, end: 1.0).animate(_controller
    //   ..addListener(() {
    //     setState(() {});
    //   }));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.animateTo(0.5, duration: const Duration(seconds: 1));
    widget.controller.start = () => _controller.forward();
    widget.controller.pause = () => _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressingArc(
      controller: _controller,
      color: Colors.blue,
      size: widget.size,
      strokeWidth: widget.strokeWidth,
    );
  }
}
