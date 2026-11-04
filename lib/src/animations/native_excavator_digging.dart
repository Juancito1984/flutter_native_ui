import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de excavadora de ingeniería en ciclo de excavación.
class NativeExcavatorDigging extends StatefulWidget {
  final double size;
  final Color bodyColor;
  final Duration duration;

  const NativeExcavatorDigging({
    super.key,
    this.size = 56.0,
    this.bodyColor = const Color(0xFFFFB300),
    this.duration = const Duration(milliseconds: 1600),
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: _ExcavatorDiggingPainter(
              armAngle: math.sin(_controller.value * math.pi) * 0.35,
              bodyColor: widget.bodyColor,
            ),
          ),
        );
      },
    );
  }
}

class _ExcavatorDiggingPainter extends CustomPainter {
  final double armAngle;
  final Color bodyColor;

  const _ExcavatorDiggingPainter({
    required this.armAngle,
    required this.bodyColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final trackPaint = Paint()
      ..color = const Color(0xFF37474F)
      ..style = PaintingStyle.fill;

    final bodyPaint = Paint()
      ..color = bodyColor
      ..style = PaintingStyle.fill;

    final armPaint = Paint()
      ..color = const Color(0xFF37474F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final windowPaint = Paint()..color = const Color(0xFF81D4FA);

    // Track
    final trackRRect = RRect.fromLTRBR(2, 17, 14, 21, const Radius.circular(2.5));
    canvas.drawRRect(trackRRect, trackPaint);

    // Track Wheels
    final wheelPaint = Paint()..color = const Color(0xFFCFD8DC);
    canvas.drawCircle(const Offset(4.5, 19), 1.2, wheelPaint);
    canvas.drawCircle(const Offset(8, 19), 1.2, wheelPaint);
    canvas.drawCircle(const Offset(11.5, 19), 1.2, wheelPaint);

    // Cabin Body
    final cabinPath = Path()
      ..moveTo(3, 17)
      ..lineTo(3, 10)
      ..lineTo(11, 10)
      ..lineTo(13, 13)
      ..lineTo(13, 17)
      ..close();
    canvas.drawPath(cabinPath, bodyPaint);

    // Window
    canvas.drawRRect(
      RRect.fromLTRBR(7, 11, 11.5, 14.5, const Radius.circular(1)),
      windowPaint,
    );

    // Animated Arm Pivot
    canvas.save();
    canvas.translate(11, 13);
    canvas.rotate(armAngle);

    final armPath = Path()
      ..moveTo(0, 0)
      ..lineTo(5, -6)
      ..lineTo(10, -1);
    canvas.drawPath(armPath, armPaint);

    // Bucket
    final bucketPath = Path()
      ..moveTo(9, -2)
      ..lineTo(12, 1)
      ..lineTo(10, 4)
      ..lineTo(8, 2)
      ..close();
    canvas.drawPath(bucketPath, bodyPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _ExcavatorDiggingPainter oldDelegate) =>
      oldDelegate.armAngle != armAngle || oldDelegate.bodyColor != bodyColor;
}
