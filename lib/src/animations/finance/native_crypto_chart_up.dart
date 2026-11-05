// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Animación nativa de gráfica financiera/cripto en crecimiento continuo.
class NativeCryptoChartUp extends StatefulWidget {
  final double width;
  final double height;
  final Color chartColor;
  final Duration duration;

  const NativeCryptoChartUp({
    super.key,
    this.width = 64.0,
    this.height = 36.0,
    this.chartColor = const Color(0xFF2E7D32),
    this.duration = const Duration(milliseconds: 1800),
  });

  @override
  State<NativeCryptoChartUp> createState() => _NativeCryptoChartUpState();
}

class _NativeCryptoChartUpState extends State<NativeCryptoChartUp>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.width,
            height: widget.height,
            child: CustomPaint(
              painter: _CryptoChartPainter(
                progress: _controller.value,
                chartColor: widget.chartColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CryptoChartPainter extends CustomPainter {
  final double progress;
  final Color chartColor;

  const _CryptoChartPainter({
    required this.progress,
    required this.chartColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final linePaint = Paint()
      ..color = chartColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final bgFillPaint = Paint()
      ..color = chartColor.withOpacity(0.18)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Full Trend Path
    final fullPath = Path()
      ..moveTo(2, 20)
      ..lineTo(7, 15)
      ..lineTo(11, 17)
      ..lineTo(16, 9)
      ..lineTo(19, 11)
      ..lineTo(22, 5);

    // Closed path for fill
    final fillPath = Path.from(fullPath)
      ..lineTo(22, 22)
      ..lineTo(2, 22)
      ..close();

    canvas.drawPath(fillPath, bgFillPaint);
    canvas.drawPath(fullPath, linePaint);

    // Active Pulse Dot on top
    final dotX = 2 + (progress * 20);
    final dotY = 18 - (progress * 13);
    final dotPaint = Paint()..color = chartColor;
    canvas.drawCircle(Offset(dotX, dotY), 2.2, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _CryptoChartPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.chartColor != chartColor;
}
