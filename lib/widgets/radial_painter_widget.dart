import 'dart:math';

import 'package:flutter/material.dart';

class RadialPainterWidget extends CustomPainter {
  final Color backgroundColor;
  final Color lineColor;
  final double percent;
  final double width;

  RadialPainterWidget(
      {Key key,
      @required this.backgroundColor,
      @required this.lineColor,
      @required this.percent,
      @required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLine = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double sweepAngle = 2 * pi * percent;
    canvas.drawCircle(center, radius, bgLine);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        sweepAngle, false, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
