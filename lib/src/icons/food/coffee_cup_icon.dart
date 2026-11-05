// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Icono vectorial de taza de café caliente.
class CoffeeCupIcon extends StatelessWidget {
  final double size;
  final Color cupColor;

  const CoffeeCupIcon({
    super.key,
    this.size = 24.0,
    this.cupColor = const Color(0xFF795548),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CoffeeCupPainter(cupColor: cupColor),
      ),
    );
  }
}

class _CoffeeCupPainter extends CustomPainter {
  final Color cupColor;

  const _CoffeeCupPainter({required this.cupColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cupPaint = Paint()
      ..color = cupColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final handlePaint = Paint()
      ..color = cupColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final steamPaint = Paint()
      ..color = cupColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    // Steam lines
    final s1 = Path()
      ..moveTo(7, 7)
      ..cubicTo(7, 5, 9, 5, 9, 3);
    final s2 = Path()
      ..moveTo(12, 7)
      ..cubicTo(12, 5, 14, 5, 14, 3);
    canvas.drawPath(s1, steamPaint);
    canvas.drawPath(s2, steamPaint);

    // Cup Body
    final cupPath = Path()
      ..moveTo(4, 9)
      ..lineTo(17, 9)
      ..lineTo(15.5, 19)
      ..cubicTo(15.5, 21, 5.5, 21, 5.5, 19)
      ..close();
    canvas.drawPath(cupPath, cupPaint);

    // Cup Handle
    final handlePath = Path()
      ..moveTo(16, 11)
      ..cubicTo(20, 11, 20, 17, 15.5, 17);
    canvas.drawPath(handlePath, handlePaint);
  }

  @override
  bool shouldRepaint(covariant _CoffeeCupPainter oldDelegate) =>
      oldDelegate.cupColor != cupColor;
}
