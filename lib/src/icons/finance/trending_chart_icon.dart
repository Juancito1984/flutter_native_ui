import 'package:flutter/material.dart';

/// Icono vectorial de gráfica financiera de tendencia ascendente.
class TrendingChartIcon extends StatelessWidget {
  final double size;
  final Color chartColor;

  const TrendingChartIcon({
    super.key,
    this.size = 24.0,
    this.chartColor = const Color(0xFF2E7D32),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _TrendingChartPainter(chartColor: chartColor),
      ),
    );
  }
}

class _TrendingChartPainter extends CustomPainter {
  final Color chartColor;

  const _TrendingChartPainter({required this.chartColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final linePaint = Paint()
      ..color = chartColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final arrowPaint = Paint()
      ..color = chartColor
      ..style = PaintingStyle.fill;

    // Trend Line
    final path = Path()
      ..moveTo(3, 17)
      ..lineTo(8, 12)
      ..lineTo(13, 15)
      ..lineTo(21, 6);
    canvas.drawPath(path, linePaint);

    // Arrow Head
    final arrow = Path()
      ..moveTo(21, 6)
      ..lineTo(16, 6)
      ..lineTo(21, 11)
      ..close();
    canvas.drawPath(arrow, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant _TrendingChartPainter oldDelegate) =>
      oldDelegate.chartColor != chartColor;
}
