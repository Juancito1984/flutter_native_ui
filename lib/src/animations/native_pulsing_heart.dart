// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Corazón pulsante vectorial nativo con resplandor.
class NativePulsingHeart extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;
  final double minScale;
  final double maxScale;

  const NativePulsingHeart({
    super.key,
    this.size = 48.0,
    this.color = const Color(0xFFE53935),
    this.duration = const Duration(milliseconds: 800),
    this.minScale = 0.85,
    this.maxScale = 1.18,
  });

  @override
  State<NativePulsingHeart> createState() => _NativePulsingHeartState();
}

class _NativePulsingHeartState extends State<NativePulsingHeart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CustomPaint(
          size: Size(widget.size, widget.size),
          painter: _HeartPainter(color: widget.color),
        ),
      ),
    );
  }
}

class _HeartPainter extends CustomPainter {
  final Color color;

  const _HeartPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final shadowPaint = Paint()
      ..color = color.withOpacity(0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    final heartPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path();
    path.moveTo(width * 0.5, height * 0.85);

    path.cubicTo(
      width * 0.15, height * 0.6,
      0, height * 0.38,
      width * 0.25, height * 0.16,
    );

    path.cubicTo(
      width * 0.4, height * 0.02,
      width * 0.5, height * 0.25,
      width * 0.5, height * 0.25,
    );

    path.cubicTo(
      width * 0.5, height * 0.25,
      width * 0.6, height * 0.02,
      width * 0.75, height * 0.16,
    );

    path.cubicTo(
      width, height * 0.38,
      width * 0.85, height * 0.6,
      width * 0.5, height * 0.85,
    );

    path.close();

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, heartPaint);
  }

  @override
  bool shouldRepaint(covariant _HeartPainter oldDelegate) =>
      oldDelegate.color != color;
}
