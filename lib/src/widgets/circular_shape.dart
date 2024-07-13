import 'package:flutter/material.dart';

class CircularShapeWidget extends StatelessWidget {
  final double diameter;
  final Color color;
  final Widget child;

  CircularShapeWidget({
    required this.diameter,
    required this.color,
    this.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
