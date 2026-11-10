import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Microchip CPU / Procesador de IA.
class CpuChipIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const CpuChipIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : theme.colorScheme.secondary);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CpuChipIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _CpuChipIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _CpuChipIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bodyPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final corePaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Main Outer Body RRect
    final bodyRect = RRect.fromRectAndRadius(
      const Rect.fromLTRB(5.0, 5.0, 19.0, 19.0),
      const Radius.circular(3.0),
    );
    canvas.drawRRect(bodyRect, bodyPaint);

    // Center Core Rect (Vibrant Accent Fill)
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTRB(9.0, 9.0, 15.0, 15.0), const Radius.circular(1.5)),
      corePaint,
    );

    // Pins (Top, Bottom, Left, Right)
    final pinPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    // Top Pins
    canvas.drawLine(const Offset(8.0, 2.0), const Offset(8.0, 5.0), pinPaint);
    canvas.drawLine(const Offset(12.0, 2.0), const Offset(12.0, 5.0), pinPaint);
    canvas.drawLine(const Offset(16.0, 2.0), const Offset(16.0, 5.0), pinPaint);

    // Bottom Pins
    canvas.drawLine(const Offset(8.0, 19.0), const Offset(8.0, 22.0), pinPaint);
    canvas.drawLine(const Offset(12.0, 19.0), const Offset(12.0, 22.0), pinPaint);
    canvas.drawLine(const Offset(16.0, 19.0), const Offset(16.0, 22.0), pinPaint);

    // Left Pins
    canvas.drawLine(const Offset(2.0, 8.0), const Offset(5.0, 8.0), pinPaint);
    canvas.drawLine(const Offset(2.0, 12.0), const Offset(5.0, 12.0), pinPaint);
    canvas.drawLine(const Offset(2.0, 16.0), const Offset(5.0, 16.0), pinPaint);

    // Right Pins
    canvas.drawLine(const Offset(19.0, 8.0), const Offset(22.0, 8.0), pinPaint);
    canvas.drawLine(const Offset(19.0, 12.0), const Offset(22.0, 12.0), pinPaint);
    canvas.drawLine(const Offset(19.0, 16.0), const Offset(22.0, 16.0), pinPaint);
  }

  @override
  bool shouldRepaint(covariant _CpuChipIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
