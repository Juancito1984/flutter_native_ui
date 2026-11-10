import 'package:flutter/material.dart';

/// Animación nativa de corazón latiente.
class NativePulsingHeart extends StatefulWidget {
  final double size;
  final Color? color;
  final Duration duration;

  const NativePulsingHeart({
    super.key,
    this.size = 44.0,
    this.color,
    this.duration = const Duration(milliseconds: 1000),
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

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final heartColor = widget.color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFE53935));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: CustomPaint(
                painter: _HeartPainter(color: heartColor),
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
      ..lineTo(10.55, 20.03)
      ..cubicTo(5.4, 15.36, 2, 12.28, 2, 8.5)
      ..cubicTo(2, 5.42, 4.42, 3, 7.5, 3)
      ..cubicTo(9.24, 3, 10.91, 3.81, 12, 5.09)
      ..cubicTo(13.09, 3.81, 14.76, 3, 16.5, 3)
      ..cubicTo(19.58, 3, 22, 5.42, 22, 8.5)
      ..cubicTo(22, 12.28, 18.6, 15.36, 13.45, 20.04)
      ..close();

    canvas.drawPath(path, heartPaint);
  }

  @override
  bool shouldRepaint(covariant _HeartPainter oldDelegate) =>
      oldDelegate.color != color;
}
