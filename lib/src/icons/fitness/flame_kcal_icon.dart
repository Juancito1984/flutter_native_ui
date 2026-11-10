import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Llama de Calorías / Fuego Fitness.
class FlameKcalIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const FlameKcalIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFFF5722));
    final goldAccent = secondaryColor ?? const Color(0xFFFFCA28);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _FlameKcalIconPainter(
          primaryColor: primary,
          accentColor: goldAccent,
        ),
      ),
    );
  }
}

class _FlameKcalIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _FlameKcalIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final outerFlamePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final innerFlamePaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Outer Flame Contour
    final flamePath = Path()
      ..moveTo(12.0, 3.0)
      ..cubicTo(14.0, 7.0, 18.0, 8.5, 18.0, 13.5)
      ..cubicTo(18.0, 17.5, 15.5, 20.5, 12.0, 20.5)
      ..cubicTo(8.5, 20.5, 6.0, 17.5, 6.0, 13.5)
      ..cubicTo(6.0, 10.0, 9.0, 7.5, 10.0, 5.0)
      ..cubicTo(10.5, 8.0, 13.0, 9.5, 13.0, 11.5);
    canvas.drawPath(flamePath, outerFlamePaint);

    // Inner Core Flame (Vibrant Golden Accent)
    final innerPath = Path()
      ..moveTo(12.0, 11.5)
      ..cubicTo(10.0, 12.5, 9.0, 14.5, 10.5, 17.0)
      ..cubicTo(12.0, 19.0, 14.0, 17.5, 14.0, 15.5)
      ..close();
    canvas.drawPath(innerPath, innerFlamePaint);
  }

  @override
  bool shouldRepaint(covariant _FlameKcalIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
