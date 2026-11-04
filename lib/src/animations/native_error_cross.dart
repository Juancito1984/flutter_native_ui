import 'package:flutter/material.dart';

/// Animación nativa de cruz de error.
class NativeErrorCross extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;

  const NativeErrorCross({
    super.key,
    this.size = 56.0,
    this.color = const Color(0xFFC62828),
    this.duration = const Duration(milliseconds: 900),
  });

  @override
  State<NativeErrorCross> createState() => _NativeErrorCrossState();
}

class _NativeErrorCrossState extends State<NativeErrorCross>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: _ErrorCrossPainter(
              progress: _controller.value,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}

class _ErrorCrossPainter extends CustomPainter {
  final double progress;
  final Color color;

  const _ErrorCrossPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..isAntiAlias = true;

    final circleProgress = (progress / 0.5).clamp(0.0, 1.0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.57,
      6.28 * circleProgress,
      false,
      circlePaint,
    );

    if (progress > 0.5) {
      final crossProgress = ((progress - 0.5) / 0.5).clamp(0.0, 1.0);

      final crossPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true;

      final start1 = Offset(size.width * 0.32, size.height * 0.32);
      final end1 = Offset(size.width * 0.68, size.height * 0.68);
      final start2 = Offset(size.width * 0.68, size.height * 0.32);
      final end2 = Offset(size.width * 0.32, size.height * 0.68);

      final p1 = Path()
        ..moveTo(start1.dx, start1.dy)
        ..lineTo(
          start1.dx + (end1.dx - start1.dx) * crossProgress,
          start1.dy + (end1.dy - start1.dy) * crossProgress,
        );

      final p2 = Path()
        ..moveTo(start2.dx, start2.dy)
        ..lineTo(
          start2.dx + (end2.dx - start2.dx) * crossProgress,
          start2.dy + (end2.dy - start2.dy) * crossProgress,
        );

      canvas.drawPath(p1, crossPaint);
      canvas.drawPath(p2, crossPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ErrorCrossPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
