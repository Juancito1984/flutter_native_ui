// ignore_for_file: deprecated_member_use

import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de taza de café echando vapor/humo caliente en vivo.
class NativeCoffeeSteam extends StatefulWidget {
  final double size;
  final Color cupColor;
  final Duration duration;

  const NativeCoffeeSteam({
    super.key,
    this.size = 56.0,
    this.cupColor = const Color(0xFF795548),
    this.duration = const Duration(milliseconds: 1600),
  });

  @override
  State<NativeCoffeeSteam> createState() => _NativeCoffeeSteamState();
}

class _NativeCoffeeSteamState extends State<NativeCoffeeSteam>
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
              painter: _CoffeeSteamPainter(
                progress: _controller.value,
                cupColor: widget.cupColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CoffeeSteamPainter extends CustomPainter {
  final double progress;
  final Color cupColor;

  const _CoffeeSteamPainter({
    required this.progress,
    required this.cupColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cupPaint = Paint()
      ..color = cupColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final handlePaint = Paint()
      ..color = cupColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Cup Body
    final cupPath = Path()
      ..moveTo(4, 10)
      ..lineTo(17, 10)
      ..lineTo(15.5, 20)
      ..cubicTo(15.5, 22, 5.5, 22, 5.5, 20)
      ..close();
    canvas.drawPath(cupPath, cupPaint);

    // Cup Handle
    final handlePath = Path()
      ..moveTo(16, 12)
      ..cubicTo(20, 12, 20, 18, 15.5, 18);
    canvas.drawPath(handlePath, handlePaint);

    // Animated Rising Steam
    for (int i = 0; i < 3; i++) {
      final offsetPhase = i * 0.33;
      final t = (progress + offsetPhase) % 1.0;
      final steamY = 9.0 - (t * 6.0);
      final opacity = math.sin(t * math.pi);

      final steamPaint = Paint()
        ..color = cupColor.withOpacity(0.5 * opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..strokeCap = StrokeCap.round;

      final x = 7.0 + (i * 3.5) + (math.sin(t * math.pi * 2) * 1.0);
      final p = Path()
        ..moveTo(x, steamY)
        ..cubicTo(x - 1, steamY - 1.5, x + 1, steamY - 3, x, steamY - 4);
      canvas.drawPath(p, steamPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _CoffeeSteamPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.cupColor != cupColor;
}
