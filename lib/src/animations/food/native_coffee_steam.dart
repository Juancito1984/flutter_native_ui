import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de vapor de café caliente ascendente.
class NativeCoffeeSteam extends StatefulWidget {
  final double size;
  final Color? cupColor;
  final Color? steamColor;
  final Duration duration;

  const NativeCoffeeSteam({
    super.key,
    this.size = 48.0,
    this.cupColor,
    this.steamColor,
    this.duration = const Duration(milliseconds: 2000),
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primaryCup = widget.cupColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF6D4C41));
    final activeSteam = widget.steamColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFBCAAA4));

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
                cupColor: primaryCup,
                steamColor: activeSteam,
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
  final Color steamColor;

  const _CoffeeSteamPainter({
    required this.progress,
    required this.cupColor,
    required this.steamColor,
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
      ..moveTo(4, 11)
      ..lineTo(17, 11)
      ..lineTo(15.5, 20)
      ..cubicTo(15.5, 22, 5.5, 22, 5.5, 20)
      ..close();
    canvas.drawPath(cupPath, cupPaint);

    // Cup Handle
    final handlePath = Path()
      ..moveTo(16, 13)
      ..cubicTo(20, 13, 20, 18, 15.5, 18);
    canvas.drawPath(handlePath, handlePaint);

    // Animated Steam Lines
    void drawSteam(double x, double delay) {
      final t = (progress + delay) % 1.0;
      final yOffset = 10.0 - (t * 8.0);
      final alpha = math.sin(t * math.pi);

      final steamPaint = Paint()
        ..color = steamColor.withValues(alpha: alpha.clamp(0.0, 1.0))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.4
        ..strokeCap = StrokeCap.round;

      final steamPath = Path()
        ..moveTo(x, yOffset)
        ..cubicTo(x - 1, yOffset - 2, x + 1, yOffset - 4, x, yOffset - 6);
      canvas.drawPath(steamPath, steamPaint);
    }

    drawSteam(7.0, 0.0);
    drawSteam(11.0, 0.33);
    drawSteam(14.0, 0.66);
  }

  @override
  bool shouldRepaint(covariant _CoffeeSteamPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.cupColor != cupColor || oldDelegate.steamColor != steamColor;
}
