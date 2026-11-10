import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de Excavadora en Movimiento de Excavación.
class NativeExcavatorDigging extends StatefulWidget {
  final double size;
  final Color? excavatorColor;
  final Duration duration;

  const NativeExcavatorDigging({
    super.key,
    this.size = 56.0,
    this.excavatorColor,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<NativeExcavatorDigging> createState() => _NativeExcavatorDiggingState();
}

class _NativeExcavatorDiggingState extends State<NativeExcavatorDigging>
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final color = widget.excavatorColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFFFB300));

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _ExcavatorDiggingPainter(
                armAngle: math.sin(_controller.value * math.pi) * 0.25,
                color: color,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ExcavatorDiggingPainter extends CustomPainter {
  final double armAngle;
  final Color color;

  const _ExcavatorDiggingPainter({
    required this.armAngle,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Track Base
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(2, 16, 14, 5), const Radius.circular(2.5)),
      strokePaint,
    );

    // Cabin
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(5, 10, 8, 6), const Radius.circular(1.5)),
      fillPaint,
    );

    // Moving Arm
    canvas.save();
    canvas.translate(11, 11);
    canvas.rotate(armAngle);

    final armPath = Path()
      ..moveTo(0, 0)
      ..lineTo(5, -7)
      ..lineTo(10, -2)
      ..lineTo(11, 3);
    canvas.drawPath(armPath, strokePaint..strokeWidth = 2.0);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _ExcavatorDiggingPainter oldDelegate) =>
      oldDelegate.armAngle != armAngle || oldDelegate.color != color;
}
