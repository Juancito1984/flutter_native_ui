import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de taza de café caliente.
class CoffeeCupIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;
  final Color? cupColor;

  const CoffeeCupIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
    this.cupColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final activeCup = color ?? cupColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF6D4C41));
    final activeSteam = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFBCAAA4));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CoffeeCupPainter(
          cupColor: activeCup,
          steamColor: activeSteam,
        ),
      ),
    );
  }
}

class _CoffeeCupPainter extends CustomPainter {
  final Color cupColor;
  final Color steamColor;

  const _CoffeeCupPainter({
    required this.cupColor,
    required this.steamColor,
  });

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
      ..color = steamColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    // Steam lines (Vibrant Steam Accent)
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
      oldDelegate.cupColor != cupColor || oldDelegate.steamColor != steamColor;
}
