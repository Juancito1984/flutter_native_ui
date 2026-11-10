import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de avión para viajes y turismo.
class AirplaneIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;
  final Color? planeColor;

  const AirplaneIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
    this.planeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? planeColor ?? (isDark ? theme.colorScheme.onSurface : theme.colorScheme.primary);
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF0288D1));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _AirplanePainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _AirplanePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _AirplanePainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final planePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.save();
    canvas.translate(12, 12);
    canvas.rotate(-0.785398); // -45 deg

    final planePath = Path()
      ..moveTo(0, -10)
      ..cubicTo(2, -10, 3, -6, 3, -2)
      ..lineTo(10, 3)
      ..lineTo(10, 6)
      ..lineTo(3, 4)
      ..lineTo(3, 8)
      ..lineTo(6, 10)
      ..lineTo(6, 12)
      ..lineTo(0, 10)
      ..lineTo(-6, 12)
      ..lineTo(-6, 10)
      ..lineTo(-3, 8)
      ..lineTo(-3, 4)
      ..lineTo(-10, 6)
      ..lineTo(-10, 3)
      ..lineTo(-3, -2)
      ..cubicTo(-3, -6, -2, -10, 0, -10)
      ..close();

    canvas.drawPath(planePath, planePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _AirplanePainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
