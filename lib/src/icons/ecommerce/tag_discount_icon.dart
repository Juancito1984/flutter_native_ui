import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de etiqueta de descuento.
class TagDiscountIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const TagDiscountIcon({
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
    final goldAccent = secondaryColor ?? const Color(0xFFFFB703);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _TagDiscountPainter(
          primaryColor: primary,
          accentColor: goldAccent,
        ),
      ),
    );
  }
}

class _TagDiscountPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _TagDiscountPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final tagPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    canvas.save();
    canvas.translate(12, 12);
    canvas.rotate(-0.785398); // -45 deg

    // Tag Polygon
    final tagPath = Path()
      ..moveTo(-8, -4)
      ..lineTo(2, -4)
      ..lineTo(8, 2)
      ..lineTo(2, 8)
      ..lineTo(-8, 8)
      ..close();
    canvas.drawPath(tagPath, tagPaint);

    // Tag Hole (Vibrant Gold Accent)
    canvas.drawCircle(const Offset(-4, 2), 1.6, Paint()..color = accentColor);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _TagDiscountPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
