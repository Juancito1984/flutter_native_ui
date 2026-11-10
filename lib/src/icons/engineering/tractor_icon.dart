import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de tractor agrícola e industrial.
class TractorIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const TractorIcon({
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
    final yellowAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFB300));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _TractorPainter(
          primaryColor: primary,
          accentColor: yellowAccent,
        ),
      ),
    );
  }
}

class _TractorPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _TractorPainter({
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

    final bodyFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Body (Vibrant Yellow Industrial Accent)
    final body = Path()
      ..moveTo(4, 9)
      ..lineTo(12, 9)
      ..lineTo(12, 14)
      ..lineTo(4, 14)
      ..close();
    canvas.drawPath(body, bodyFill);

    // Engine Hood & Exhaust
    canvas.drawRect(const Rect.fromLTWH(12, 11, 7, 3), bodyFill);
    canvas.drawLine(const Offset(16, 11), const Offset(16, 7), strokePaint);

    // Big Rear Wheel
    canvas.drawCircle(const Offset(7, 15), 4.0, strokePaint..strokeWidth = 2.2);

    // Small Front Wheel
    canvas.drawCircle(const Offset(17, 16), 2.2, Paint()..color = const Color(0xFF263238));
  }

  @override
  bool shouldRepaint(covariant _TractorPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
