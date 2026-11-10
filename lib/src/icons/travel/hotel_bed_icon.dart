import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de cama de hotel.
class HotelBedIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const HotelBedIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF1E88E5));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _HotelBedPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _HotelBedPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _HotelBedPainter({
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

    // Headboard
    canvas.drawLine(const Offset(3, 7), const Offset(3, 19), strokePaint);

    // Footboard
    canvas.drawLine(const Offset(21, 13), const Offset(21, 19), strokePaint);

    // Mattress line
    canvas.drawLine(const Offset(3, 15), const Offset(21, 15), strokePaint);

    // Pillow (Vibrant Accent Fill)
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(5, 10, 5, 4), const Radius.circular(1)),
      fillPaint,
    );

    // Blanket
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(11, 11, 9, 4), const Radius.circular(1)),
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _HotelBedPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
