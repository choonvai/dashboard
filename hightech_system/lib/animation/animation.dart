import 'package:flutter/material.dart';
import 'dart:math' show pi;

class TheAnimation extends StatefulWidget {
  const TheAnimation({super.key});

  @override
  State<TheAnimation> createState() => _TheAnimationState();
}

class _TheAnimationState extends State<TheAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _translationXAnimation;
  late Animation<double> _translationYAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // Animation duration extended
    );

    // Rotation animation
    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);

    // Translation animations
    _translationXAnimation = Tween<double>(begin: 0.0, end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _translationYAnimation = Tween<double>(begin: 400, end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.repeat(reverse: true); // Repeat the animation in reverse
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..translate(_translationXAnimation.value, _translationYAnimation.value)
                ..rotateZ(_rotationAnimation.value)
                ..scale(1.5),
              child: Container(
                width: 100,
                height: 100, 
                decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color:Colors.yellow
                )
              ),
            );
          },
        ),
      ),
    );
  }
}
