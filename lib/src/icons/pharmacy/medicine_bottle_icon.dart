import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de frasco de medicina.
class MedicineBottleIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const MedicineBottleIcon({
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
        painter: _MedicineBottlePainter(
          primaryColor: primary,
          accentColor: redAccent,
        ),
      ),
    );
  }
}

class _MedicineBottlePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _MedicineBottlePainter({
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

    final crossFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Cap
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(7, 3, 10, 3), const Radius.circular(1)),
      crossFill,
    );

    // Bottle Body RRect
    final bodyRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(5, 6, 14, 15),
      const Radius.circular(3),
    );
    canvas.drawRRect(bodyRRect, strokePaint);

    // Plus Cross Label (Vibrant Crimson Accent)
    canvas.drawRect(const Rect.fromLTWH(11.2, 11, 1.6, 5), crossFill);
    canvas.drawRect(const Rect.fromLTWH(9.5, 12.7, 5, 1.6), crossFill);
  }

  @override
  bool shouldRepaint(covariant _MedicineBottlePainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
