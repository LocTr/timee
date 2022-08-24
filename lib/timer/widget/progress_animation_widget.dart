import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProgressAnimationWidget extends StatefulWidget {
  ProgressAnimationWidget({Key? key}) : super(key: key);

  @override
  State<ProgressAnimationWidget> createState() =>
      _ProgressAnimationWidgetState();
}

class _ProgressAnimationWidgetState extends State<ProgressAnimationWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    final curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);
    super.initState();

    _animation = Tween(begin: 0.0, end: 3.14).animate(curvedAnimation
      ..addListener(() {
        setState(() {});
      }));
    _controller.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: CirclePainter(arc: _animation.value, color: Colors.blue),
      ),
    );
  }
}

// void _drawArcWithCenter(
//   Canvas canvas,
//   Paint paint,
//   {
//     Offset center,
//     double radius,
//     startRadian = 0.0,
//     sweepRadian = pi,
//   }
// )

class CirclePainter extends CustomPainter {
  double arc;
  Color color;

  CirclePainter({required this.arc, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..isAntiAlias = true
      ..strokeWidth = 10;

    canvas.drawArc(Rect.fromCircle(center: const Offset(50, 50), radius: 50), 0,
        arc, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
