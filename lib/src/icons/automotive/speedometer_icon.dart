import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de velocímetro de vehículo.
class SpeedometerIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const SpeedometerIcon({
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
    final needleAccent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFE53935));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SpeedometerPainter(
          primaryColor: primary,
          accentColor: needleAccent,
        ),
      ),
    );
  }
}

class _SpeedometerPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _SpeedometerPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final arcStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final needleStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final centerFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Gauge Arc
    canvas.drawArc(const Rect.fromLTWH(3, 4, 18, 18), -3.5, 3.9, false, arcStroke);

    // Needle Pointing Top Right (Vibrant Red/Coral Accent)
    canvas.drawLine(const Offset(12, 13), const Offset(17, 8), needleStroke);
    canvas.drawCircle(const Offset(12, 13), 2.0, centerFill);
  }

  @override
  bool shouldRepaint(covariant _SpeedometerPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
