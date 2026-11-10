import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de camión de envíos.
class DeliveryTruckIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const DeliveryTruckIcon({
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
        painter: _DeliveryTruckPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _DeliveryTruckPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _DeliveryTruckPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cargoPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final cabinPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final wheelPaint = Paint()
      ..color = const Color(0xFF263238)
      ..style = PaintingStyle.fill;

    // Cargo Body
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(2, 7, 13, 10), const Radius.circular(2)),
      cargoPaint,
    );

    // Cabin (Vibrant Accent)
    final cabin = Path()
      ..moveTo(15, 10)
      ..lineTo(20, 11)
      ..lineTo(21, 17)
      ..lineTo(15, 17)
      ..close();
    canvas.drawPath(cabin, cabinPaint);

    // Wheels
    canvas.drawCircle(const Offset(6, 17), 2.2, wheelPaint);
    canvas.drawCircle(const Offset(18, 17), 2.2, wheelPaint);
  }

  @override
  bool shouldRepaint(covariant _DeliveryTruckPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
