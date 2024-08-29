import 'package:flutter/material.dart';
import 'dart:math';

class GeometricAnimation extends StatefulWidget {
  @override
  _GeometricAnimationState createState() => _GeometricAnimationState();
}

class _GeometricAnimationState extends State<GeometricAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: GeometricPainter(_animation.value),
              size: Size(300, 300),
            );
          },
        ),
    );
  }
}

class GeometricPainter extends CustomPainter {
  final double animationValue;
  GeometricPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Draw a circle that rotates
    paint.color = Colors.red;
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(animationValue);
    canvas.drawCircle(Offset(0, 0), 50, paint);
    canvas.restore();

    // Draw a rectangle that moves vertically
    paint.color = Colors.white;
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2 + 100 * sin(animationValue));
    canvas.drawRect(Rect.fromLTWH(-25, -25, 50, 50), paint);
    canvas.restore();

    // Draw lines that move and rotate
    paint.color = Colors.red;
    canvas.save();
    canvas.translate(size.width / 4, size.height / 4);
    canvas.rotate(animationValue * 2);
    canvas.drawLine(Offset(-50, 0), Offset(50, 0), paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}