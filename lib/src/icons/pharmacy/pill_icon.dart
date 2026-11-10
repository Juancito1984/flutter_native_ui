import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de cápsula / pastilla médica.
class PillIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const PillIcon({
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
    final redAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFE53935));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _PillPainter(
          primaryColor: primary,
          accentColor: redAccent,
        ),
      ),
    );
  }
}

class _PillPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _PillPainter({
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
      ..isAntiAlias = true;

    final fillPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(12, 12);
    canvas.rotate(0.785398); // 45 deg

    // Capsule RRect
    final pillRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(-5, -10, 10, 20),
      const Radius.circular(5),
    );
    canvas.drawRRect(pillRRect, strokePaint);

    // Half Fill (Vibrant Crimson Accent)
    final halfPath = Path()
      ..addRect(const Rect.fromLTWH(-5, 0, 10, 10));
    canvas.save();
    canvas.clipPath(Path()..addRRect(pillRRect));
    canvas.drawPath(halfPath, fillPaint);
    canvas.restore();

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _PillPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
