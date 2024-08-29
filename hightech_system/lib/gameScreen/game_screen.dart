import 'package:flutter/material.dart';
import 'dart:async';
import 'snake_painter.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Offset snakePosition = Offset(100, 100); // Initial position of the snake
  Offset targetPosition = Offset(100, 100); // Position to move towards
  final double stepSize = 5.0; // How much the snake moves per step
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startMoving();
  }

  void startMoving() {
    timer = Timer.periodic(Duration(milliseconds: 50), (Timer timer) {
      if (snakePosition != targetPosition) {
        setState(() {
          moveSnake();
        });
      }
    });
  }

  void moveSnake() {
    double deltaX = targetPosition.dx - snakePosition.dx;
    double deltaY = targetPosition.dy - snakePosition.dy;

    if (deltaX.abs() > stepSize) {
      snakePosition = Offset(
        snakePosition.dx + stepSize * (deltaX / deltaX.abs()),
        snakePosition.dy,
      );
    } else if (deltaY.abs() > stepSize) {
      snakePosition = Offset(
        snakePosition.dx,
        snakePosition.dy + stepSize * (deltaY / deltaY.abs()),
      );
    } else {
      snakePosition = targetPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: GestureDetector(
        onTapDown: (details) {
          setState(() {
            targetPosition = details.localPosition;
          });
        },
        child: CustomPaint(
          painter: SnakePainter(snakePosition),
          child: Container(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
