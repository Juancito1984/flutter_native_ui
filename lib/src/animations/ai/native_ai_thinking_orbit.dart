import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de IA Generando / Pensando con órbitas giratorias.
class NativeAiThinkingOrbit extends StatefulWidget {
  final double size;
  final Color primaryColor;
  final Color accentColor;
  final Duration duration;

  const NativeAiThinkingOrbit({
    super.key,
    this.size = 56.0,
    this.primaryColor = const Color(0xFF7B2CBF),
    this.accentColor = const Color(0xFF00F5D4),
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<NativeAiThinkingOrbit> createState() => _NativeAiThinkingOrbitState();
}

class _NativeAiThinkingOrbitState extends State<NativeAiThinkingOrbit>
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
              painter: _AiThinkingOrbitPainter(
                progress: _controller.value,
                primaryColor: widget.primaryColor,
                accentColor: widget.accentColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AiThinkingOrbitPainter extends CustomPainter {
  final double progress;
  final Color primaryColor;
  final Color accentColor;

  const _AiThinkingOrbitPainter({
    required this.progress,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.6;

    final centerPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Glowing Center Core
    canvas.drawCircle(center, radius * 0.4, centerPaint);

    final angle = progress * 2 * math.pi;

    final orbitPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..isAntiAlias = true;

    // Orbit Ring 1
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle);
    canvas.drawOval(Rect.fromLTRB(-radius, -radius * 0.4, radius, radius * 0.4), orbitPaint);
    canvas.drawCircle(Offset(radius, 0), 3.5, Paint()..color = accentColor);
    canvas.restore();

    // Orbit Ring 2 (Crossed)
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(-angle * 1.5);
    canvas.drawOval(Rect.fromLTRB(-radius * 0.4, -radius, radius * 0.4, radius), orbitPaint..color = primaryColor.withValues(alpha: 0.8));
    canvas.drawCircle(Offset(0, -radius), 3.0, Paint()..color = primaryColor);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _AiThinkingOrbitPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.primaryColor != primaryColor;
}
