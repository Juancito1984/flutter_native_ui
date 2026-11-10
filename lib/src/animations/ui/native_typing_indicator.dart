import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de Indicador de Escritura ("Escribiendo...").
class NativeTypingIndicator extends StatefulWidget {
  final double size;
  final Color? dotColor;
  final Duration duration;

  const NativeTypingIndicator({
    super.key,
    this.size = 36.0,
    this.dotColor,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<NativeTypingIndicator> createState() => _NativeTypingIndicatorState();
}

class _NativeTypingIndicatorState extends State<NativeTypingIndicator>
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
    final color = widget.dotColor ?? Theme.of(context).colorScheme.primary;

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size * 2.2,
            height: widget.size,
            child: CustomPaint(
              painter: _TypingIndicatorPainter(
                progress: _controller.value,
                color: color,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TypingIndicatorPainter extends CustomPainter {
  final double progress;
  final Color color;

  const _TypingIndicatorPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final dotRadius = size.height * 0.18;
    final cy = size.height / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    for (int i = 0; i < 3; i++) {
      final cx = size.width * (0.2 + i * 0.3);
      final delay = i * 0.2;
      final t = (progress - delay) % 1.0;
      final dy = cy - math.sin(t * math.pi) * (size.height * 0.25);

      canvas.drawCircle(Offset(cx, dy.clamp(0.0, size.height)), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _TypingIndicatorPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
