import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de gráfico financiero ascendente.
class TrendingChartIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const TrendingChartIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF4CAF50));
    final accent = secondaryColor ?? const Color(0xFF00E676);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _TrendingChartPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _TrendingChartPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _TrendingChartPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final linePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final fillPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Trending Up Zigzag Path
    final chartPath = Path()
      ..moveTo(3, 17)
      ..lineTo(9, 11)
      ..lineTo(13, 15)
      ..lineTo(21, 7);
    canvas.drawPath(chartPath, linePaint);

    // Arrowhead at top right
    final arrow = Path()
      ..moveTo(16, 7)
      ..lineTo(21, 7)
      ..lineTo(21, 12);
    canvas.drawPath(arrow, linePaint);

    // Dots at vertices (Vibrant Emerald Accent Fills)
    canvas.drawCircle(const Offset(3, 17), 1.6, fillPaint);
    canvas.drawCircle(const Offset(9, 11), 1.6, fillPaint);
    canvas.drawCircle(const Offset(13, 15), 1.6, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _TrendingChartPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
