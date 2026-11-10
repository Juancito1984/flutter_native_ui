import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Gota de Agua / Hidratación.
class WaterDropIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const WaterDropIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF0288D1));
    final cyanAccent = secondaryColor ?? const Color(0xFF00E676);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _WaterDropIconPainter(
          primaryColor: primary,
          accentColor: cyanAccent,
        ),
      ),
    );
  }
}

class _WaterDropIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _WaterDropIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final dropStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final accentStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Drop Path
    final dropPath = Path()
      ..moveTo(12.0, 3.0)
      ..cubicTo(12.0, 3.0, 5.0, 11.0, 5.0, 15.0)
      ..cubicTo(5.0, 19.0, 8.0, 21.0, 12.0, 21.0)
      ..cubicTo(16.0, 21.0, 19.0, 19.0, 19.0, 15.0)
      ..cubicTo(19.0, 11.0, 12.0, 3.0, 12.0, 3.0)
      ..close();
    canvas.drawPath(dropPath, dropStroke);

    // Reflection Arc Accent (Vibrant Cyan/Emerald Accent)
    canvas.drawArc(const Rect.fromLTRB(8.0, 12.0, 14.0, 18.0), -2.6, 1.4, false, accentStroke);
  }

  @override
  bool shouldRepaint(covariant _WaterDropIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
