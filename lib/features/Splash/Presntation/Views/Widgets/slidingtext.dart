import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slideAnimation,
  });

  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slideAnimation,
          child: const Text(
            ' Let’s begin our cultural journey together',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'GT Sectra Fine',
                color: Colors.white),
          ),
        );
      },
    );
  }
}
