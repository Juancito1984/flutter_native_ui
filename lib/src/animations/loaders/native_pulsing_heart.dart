// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Corazón latiendo con animación suave de pulso y escala.
class NativePulsingHeart extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;

  const NativePulsingHeart({
    super.key,
    this.size = 48.0,
    this.color = const Color(0xFFE53935),
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<NativePulsingHeart> createState() => _NativePulsingHeartState();
}


class _NativePulsingHeartState extends State<NativePulsingHeart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
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
          final scale = 0.88 + (_controller.value * 0.24);

          return Transform.scale(
            scale: scale,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: CustomPaint(
                painter: _HeartPainter(
                  color: widget.color,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HeartPainter extends CustomPainter {
  final Color color;

  const _HeartPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final heartPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path()
      ..moveTo(12, 21.35)
      ..cubicTo(5.4, 15.36, 2, 12.28, 2, 8.5)
      ..cubicTo(2, 5.42, 4.42, 3, 7.5, 3)
      ..cubicTo(9.24, 3, 10.91, 3.81, 12, 5.09)
      ..cubicTo(13.09, 3.81, 14.76, 3, 16.5, 3)
      ..cubicTo(19.58, 3, 22, 5.42, 22, 8.5)
      ..cubicTo(22, 12.28, 18.6, 15.36, 12, 21.35)
      ..close();

    canvas.drawPath(path, heartPaint);
  }

  @override
  bool shouldRepaint(covariant _HeartPainter oldDelegate) =>
      oldDelegate.color != color;
}
