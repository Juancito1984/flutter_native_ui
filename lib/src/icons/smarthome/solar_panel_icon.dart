import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de Panel Solar / Energía Renovable.
class SolarPanelIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const SolarPanelIcon({
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
    final sunAccent = secondaryColor ?? const Color(0xFFFFB703);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SolarPanelIconPainter(
          primaryColor: primary,
          accentColor: sunAccent,
        ),
      ),
    );
  }
}

class _SolarPanelIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _SolarPanelIconPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final panelStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final gridStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Panel Outer Polygon
    final panelPath = Path()
      ..moveTo(6.0, 7.0)
      ..lineTo(18.0, 7.0)
      ..lineTo(21.0, 18.0)
      ..lineTo(3.0, 18.0)
      ..close();
    canvas.drawPath(panelPath, panelStroke);

    // Inner Solar Grid lines (Vibrant Sun Accent)
    canvas.drawLine(const Offset(12.0, 7.0), const Offset(12.0, 18.0), gridStroke);
    canvas.drawLine(const Offset(4.5, 12.5), const Offset(19.5, 12.5), gridStroke);

    // Support Stand
    canvas.drawLine(const Offset(12.0, 18.0), const Offset(12.0, 22.0), panelStroke);
    canvas.drawLine(const Offset(8.0, 22.0), const Offset(16.0, 22.0), panelStroke);
  }

  @override
  bool shouldRepaint(covariant _SolarPanelIconPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
