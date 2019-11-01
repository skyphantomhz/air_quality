import 'package:flutter/material.dart';

class LinearProgressPaint extends CustomPainter {

  final primaryLinePainter = Paint()
  ..strokeCap = StrokeCap.round;

  final baseLinePainter = Paint()
  ..strokeCap = StrokeCap.round;

  final double percent;

  LinearProgressPaint({this.percent, Color primaryColor, Color secondColor, double strokeWidth = 3}){
    primaryLinePainter
    ..color = primaryColor
    ..strokeWidth = strokeWidth;
    baseLinePainter
    ..color = secondColor
    ..strokeWidth = strokeWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(0,0), Offset(size.width, 0), baseLinePainter);
    canvas.drawLine(Offset(0,0), Offset(size.width * percent, 0), primaryLinePainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

