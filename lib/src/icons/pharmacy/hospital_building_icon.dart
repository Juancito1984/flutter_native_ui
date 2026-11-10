import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de edificio de hospital.
class HospitalBuildingIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const HospitalBuildingIcon({
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
        painter: _HospitalBuildingPainter(
          primaryColor: primary,
          accentColor: redAccent,
        ),
      ),
    );
  }
}

class _HospitalBuildingPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _HospitalBuildingPainter({
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
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final crossFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Main Building Outer
    final bRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(4, 4, 16, 17),
      const Radius.circular(2),
    );
    canvas.drawRRect(bRect, strokePaint);

    // Red Cross on Top (Vibrant Crimson Accent)
    canvas.drawRect(const Rect.fromLTWH(11.2, 7, 1.6, 4), crossFill);
    canvas.drawRect(const Rect.fromLTWH(10, 8.2, 4, 1.6), crossFill);

    // Door
    canvas.drawRect(const Rect.fromLTWH(10, 16, 4, 5), strokePaint);
  }

  @override
  bool shouldRepaint(covariant _HospitalBuildingPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
