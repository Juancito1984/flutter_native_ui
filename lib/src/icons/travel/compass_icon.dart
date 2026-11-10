import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de brújula de navegación.
class CompassIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const CompassIcon({
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
    final needleNorth = secondaryColor ?? const Color(0xFFE53935);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CompassPainter(
          primaryColor: primary,
          accentColor: needleNorth,
        ),
      ),
    );
  }
}

class _CompassPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _CompassPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final circlePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    final needleNorthPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    final needleSouthPaint = Paint()
      ..color = primaryColor.withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;

    // Outer Circle
    canvas.drawCircle(const Offset(12, 12), 9, circlePaint);

    // North Needle (Vibrant Crimson Accent)
    final n1 = Path()..moveTo(12, 4)..lineTo(15, 12)..lineTo(12, 12)..close();
    canvas.drawPath(n1, needleNorthPaint);

    // South Needle
    final n2 = Path()..moveTo(12, 20)..lineTo(9, 12)..lineTo(12, 12)..close();
    canvas.drawPath(n2, needleSouthPaint);

    // Center pivot
    canvas.drawCircle(const Offset(12, 12), 1.5, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant _CompassPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
