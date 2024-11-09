import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  final Color lineColor;

  DottedLinePainter(this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = 2;

    const double dashHeight = 5, dashSpace = 5;
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}