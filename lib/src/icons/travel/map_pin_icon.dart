import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de marcador de mapa / ubicación.
class MapPinIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const MapPinIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFD32F2F));
    final dotAccent = secondaryColor ?? const Color(0xFFFFFFFF);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _MapPinPainter(
          primaryColor: primary,
          accentColor: dotAccent,
        ),
      ),
    );
  }
}

class _MapPinPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _MapPinPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final pinPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final pinPath = Path()
      ..moveTo(12, 2)
      ..cubicTo(7.5, 2, 4, 5.5, 4, 10)
      ..cubicTo(4, 15.5, 12, 22, 12, 22)
      ..cubicTo(12, 22, 20, 15.5, 20, 10)
      ..cubicTo(20, 5.5, 16.5, 2, 12, 2)
      ..close();
    canvas.drawPath(pinPath, pinPaint);

    // Center hole
    canvas.drawCircle(const Offset(12, 9.5), 3.0, Paint()..color = accentColor);
  }

  @override
  bool shouldRepaint(covariant _MapPinPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
