import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de llave de auto.
class CarKeyIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const CarKeyIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB703));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CarKeyPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _CarKeyPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _CarKeyPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final fillPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Head Bow RRect
    final head = RRect.fromRectAndRadius(const Rect.fromLTWH(3, 8, 8, 8), const Radius.circular(3));
    canvas.drawRRect(head, strokePaint);
    canvas.drawCircle(const Offset(7, 12), 1.6, fillPaint);

    // Blade
    canvas.drawLine(const Offset(11, 12), const Offset(21, 12), strokePaint..strokeWidth = 2.0);
    canvas.drawLine(const Offset(16, 12), const Offset(16, 15), strokePaint);
    canvas.drawLine(const Offset(19, 12), const Offset(19, 15), strokePaint);
  }

  @override
  bool shouldRepaint(covariant _CarKeyPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
