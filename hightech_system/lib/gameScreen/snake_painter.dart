import 'package:flutter/material.dart';

class SnakePainter extends CustomPainter {
  final Offset snakePosition;

  SnakePainter(this.snakePosition);

  @override
  void paint(Canvas canvas, Size size) {
    Paint snakePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    // Draw snake (single block)
    canvas.drawRect(Rect.fromCenter(center: snakePosition, width: 20, height: 20), snakePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
