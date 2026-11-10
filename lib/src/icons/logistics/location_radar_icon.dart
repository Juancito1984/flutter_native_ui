import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Pin de Mapa con Radar de Ubicación.
class LocationRadarIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const LocationRadarIcon({
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
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFEF5350));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _LocationRadarIconPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _LocationRadarIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _LocationRadarIconPainter({
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

    final radarStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..isAntiAlias = true;

    // Ground Radar Oval Accent
    canvas.drawOval(const Rect.fromLTRB(4.0, 18.0, 20.0, 22.0), radarStroke);

    // Map Pin
    final pinPath = Path()
      ..moveTo(12.0, 3.0)
      ..cubicTo(8.5, 3.0, 6.0, 5.5, 6.0, 9.0)
      ..cubicTo(6.0, 13.5, 12.0, 19.5, 12.0, 19.5)
      ..cubicTo(12.0, 19.5, 18.0, 13.5, 18.0, 9.0)
      ..cubicTo(18.0, 5.5, 15.5, 3.0, 12.0, 3.0)
      ..close();
    canvas.drawPath(pinPath, pinPaint);

    // Inner Dot
    canvas.drawCircle(const Offset(12.0, 9.0), 2.0, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant _LocationRadarIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
