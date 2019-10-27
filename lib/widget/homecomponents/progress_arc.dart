import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:math' as math;

class ProgressArc extends StatefulWidget {
  @override
  _ProgressArcState createState() => _ProgressArcState();
}

class _ProgressArcState extends State<ProgressArc> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: ProgressArcPaint(25, Colors.black26, Colors.green),
    );
  }
}

class ProgressArcPaint extends CustomPainter {
  final basePaint = Paint()
    ..color = Colors.black26
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  var primaryPaint = Paint()
    ..color = Colors.green[200]
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  final startAngle = -math.pi - (math.pi / 4);
  final baseAngle = (3 * math.pi) / 2;
  final useCenter = false;

  final double percent;

  final Color colorBaseLine;
  final Color colorPrimaryLine;
  double _sweepAngle;

  ProgressArcPaint(this.percent, this.colorBaseLine, this.colorPrimaryLine) {
    basePaint.color = colorBaseLine;
    primaryPaint.color = colorPrimaryLine;
    _sweepAngle = (baseAngle * percent) / 100;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);

    canvas.drawArc(rect, startAngle, baseAngle, useCenter, basePaint);
    canvas.drawArc(rect, startAngle, _sweepAngle, useCenter, primaryPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
