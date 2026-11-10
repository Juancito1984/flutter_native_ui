import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de calendario de partidos.
class MatchCalendarIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const MatchCalendarIcon({
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
    final redAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFD32F2F));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _MatchCalendarPainter(
          primaryColor: primary,
          accentColor: redAccent,
        ),
      ),
    );
  }
}

class _MatchCalendarPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _MatchCalendarPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final frameStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final headerStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final ballFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Calendar Outline
    final calRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(3, 4, 18, 17),
      const Radius.circular(3),
    );
    canvas.drawRRect(calRRect, frameStroke);

    // Top Header Line
    canvas.drawLine(const Offset(3, 9), const Offset(21, 9), frameStroke);

    // Binder Rings (Vibrant Red Accent)
    canvas.drawLine(const Offset(7, 2), const Offset(7, 5), headerStroke);
    canvas.drawLine(const Offset(17, 2), const Offset(17, 5), headerStroke);

    // Ball Dot
    canvas.drawCircle(const Offset(12, 14), 2.2, ballFill);
  }

  @override
  bool shouldRepaint(covariant _MatchCalendarPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
