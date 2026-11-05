// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Animación nativa de avión despegando con estela de nube.
class NativeFlightTakeoff extends StatefulWidget {
  final double size;
  final Color planeColor;
  final Duration duration;

  const NativeFlightTakeoff({
    super.key,
    this.size = 56.0,
    this.planeColor = const Color(0xFF0288D1),
    this.duration = const Duration(milliseconds: 1800),
  });

  @override
  State<NativeFlightTakeoff> createState() => _NativeFlightTakeoffState();
}

class _NativeFlightTakeoffState extends State<NativeFlightTakeoff>
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
              painter: _FlightTakeoffPainter(
                progress: _controller.value,
                planeColor: widget.planeColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FlightTakeoffPainter extends CustomPainter {
  final double progress;
  final Color planeColor;

  const _FlightTakeoffPainter({
    required this.progress,
    required this.planeColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final planePaint = Paint()
      ..color = planeColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final trailPaint = Paint()
      ..color = planeColor.withOpacity(0.3 * (1 - progress))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    // Moving plane position along diagonal
    final dx = -4.0 + (progress * 24.0);
    final dy = 20.0 - (progress * 18.0);

    // Jet Trail
    canvas.drawLine(const Offset(1, 21), Offset(dx + 2, dy + 2), trailPaint);

    // Plane Body
    canvas.save();
    canvas.translate(dx, dy);
    canvas.rotate(-0.52); // -30 deg takeoff tilt

    final planePath = Path()
      ..moveTo(0, -6)
      ..cubicTo(1.5, -6, 2, -3, 2, -1)
      ..lineTo(6, 2)
      ..lineTo(6, 4)
      ..lineTo(2, 3)
      ..lineTo(2, 6)
      ..lineTo(4, 7)
      ..lineTo(4, 8)
      ..lineTo(0, 7)
      ..lineTo(-4, 8)
      ..lineTo(-4, 7)
      ..lineTo(-2, 6)
      ..lineTo(-2, 3)
      ..lineTo(-6, 4)
      ..lineTo(-6, 2)
      ..lineTo(-2, -1)
      ..cubicTo(-2, -3, -1.5, -6, 0, -6)
      ..close();

    canvas.drawPath(planePath, planePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _FlightTakeoffPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.planeColor != planeColor;
}
