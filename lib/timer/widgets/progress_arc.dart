import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProgressingArc extends AnimatedWidget {
  const ProgressingArc({
    Key? key,
    required AnimationController controller,
    required this.size,
    required this.strokeWidth,
    required this.color,
  }) : super(key: key, listenable: controller);

  final double strokeWidth;
  final double size;
  final Color color;
  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(strokeWidth + size),
      painter: ArcPainter(
        strokeWidth: strokeWidth,
        radius: (size - strokeWidth) / 2,
        arc: _progress.value * 2 * math.pi,
        color: color,
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  double arc;
  double radius;
  Color color;
  double strokeWidth;

  ArcPainter({
    required this.arc,
    required this.radius,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paintFrontArc = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    var paintBackArc = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(radius + strokeWidth / 2, radius + strokeWidth / 2),
            radius: radius),
        0,
        math.pi * 2,
        false,
        paintBackArc);

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(radius + strokeWidth / 2, radius + strokeWidth / 2),
            radius: radius),
        math.pi * 1.5,
        arc,
        false,
        paintFrontArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
