import 'dart:math';

import 'package:flutter/material.dart';

class SpaceBackground extends StatelessWidget {
  const SpaceBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0B132B),
            Color(0xFF1C2541),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: StarPainter(),
            ),
          ),
          // Contenido principal
          child,
        ],
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final int numberOfStars = 100;
  final double starSize = 2;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white.withAlpha(80);
    final Random random = Random();

    for (int i = 0; i < numberOfStars; i++) {
      final double x = random.nextDouble() * size.width;
      final double y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), starSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
