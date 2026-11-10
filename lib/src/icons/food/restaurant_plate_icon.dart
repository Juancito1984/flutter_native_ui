import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de plato de restaurante con cubiertos.
class RestaurantPlateIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const RestaurantPlateIcon({
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
        painter: _RestaurantPlatePainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _RestaurantPlatePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _RestaurantPlatePainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final plateStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    final cutleryStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Plate Circle Outer & Inner
    canvas.drawCircle(const Offset(12, 12), 8, plateStroke);
    canvas.drawCircle(const Offset(12, 12), 5, plateStroke..strokeWidth = 1.0);

    // Fork (Left - Vibrant Cutlery Accent)
    canvas.drawLine(const Offset(2, 6), const Offset(2, 18), cutleryStroke);

    // Knife (Right - Vibrant Cutlery Accent)
    canvas.drawLine(const Offset(22, 6), const Offset(22, 18), cutleryStroke);
  }

  @override
  bool shouldRepaint(covariant _RestaurantPlatePainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
