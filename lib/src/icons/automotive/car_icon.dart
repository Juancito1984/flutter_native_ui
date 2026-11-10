import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de automóvil para automotriz y movilidad.
class CarIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;
  final Color? carColor;

  const CarIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
    this.carColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? carColor ?? (isDark ? theme.colorScheme.onSurface : theme.colorScheme.primary);
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF0288D1));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CarPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _CarPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _CarPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final carPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final wheelPaint = Paint()
      ..color = const Color(0xFF263238)
      ..style = PaintingStyle.fill;

    final windowPaint = Paint()
      ..color = accentColor.withValues(alpha: 0.6)
      ..style = PaintingStyle.fill;

    // Car Roof / Windows Body
    final roofPath = Path()
      ..moveTo(6, 12)
      ..lineTo(8.5, 7)
      ..lineTo(15.5, 7)
      ..lineTo(18, 12)
      ..close();
    canvas.drawPath(roofPath, windowPaint);

    // Main Car Body
    final bodyPath = Path()
      ..moveTo(2, 12)
      ..lineTo(22, 12)
      ..cubicTo(23, 12, 23, 16, 22, 16)
      ..lineTo(2, 16)
      ..cubicTo(1, 16, 1, 12, 2, 12)
      ..close();
    canvas.drawPath(bodyPath, carPaint);

    // Wheels
    canvas.drawCircle(const Offset(6, 16.5), 2.5, wheelPaint);
    canvas.drawCircle(const Offset(18, 16.5), 2.5, wheelPaint);
  }

  @override
  bool shouldRepaint(covariant _CarPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
