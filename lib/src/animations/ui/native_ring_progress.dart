import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de Anillo de Progreso Circular con Degradado.
class NativeRingProgress extends StatefulWidget {
  final double size;
  final Color primaryColor;
  final Color secondaryColor;
  final Duration duration;

  const NativeRingProgress({
    super.key,
    this.size = 56.0,
    this.primaryColor = const Color(0xFF00E676),
    this.secondaryColor = const Color(0xFF2979FF),
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<NativeRingProgress> createState() => _NativeRingProgressState();
}

class _NativeRingProgressState extends State<NativeRingProgress>
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
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _RingProgressPainter(
                progress: _controller.value,
                primaryColor: widget.primaryColor,
                secondaryColor: widget.secondaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RingProgressPainter extends CustomPainter {
  final double progress;
  final Color primaryColor;
  final Color secondaryColor;

  const _RingProgressPainter({
    required this.progress,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 8.0) / 2;

    final trackPaint = Paint()
      ..color = primaryColor.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..isAntiAlias = true;

    canvas.drawCircle(center, radius, trackPaint);

    final sweepAngle = progress * 2 * math.pi;

    final ringPaint = Paint()
      ..shader = SweepGradient(
        colors: [primaryColor, secondaryColor, primaryColor],
        transform: GradientRotation(-math.pi / 2),
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      ringPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _RingProgressPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.primaryColor != primaryColor;
}
