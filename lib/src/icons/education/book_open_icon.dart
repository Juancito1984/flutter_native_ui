import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de libro abierto.
class BookOpenIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const BookOpenIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : theme.colorScheme.primary);
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF0288D1));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BookOpenPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _BookOpenPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _BookOpenPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final leftPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final rightPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    // Left Page
    final leftPath = Path()
      ..moveTo(12, 6)
      ..cubicTo(9, 4, 5, 4, 3, 5)
      ..lineTo(3, 19)
      ..cubicTo(5, 18, 9, 18, 12, 20)
      ..close();
    canvas.drawPath(leftPath, leftPaint);

    // Right Page (Vibrant Azure Accent)
    final rightPath = Path()
      ..moveTo(12, 6)
      ..cubicTo(15, 4, 19, 4, 21, 5)
      ..lineTo(21, 19)
      ..cubicTo(19, 18, 15, 18, 12, 20)
      ..close();
    canvas.drawPath(rightPath, rightPaint);
  }

  @override
  bool shouldRepaint(covariant _BookOpenPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
