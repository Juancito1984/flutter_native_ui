import 'package:flutter/material.dart';

/// Animación nativa de avión despegando sobre horizonte.
class NativeFlightTakeoff extends StatefulWidget {
  final double size;
  final Color? planeColor;
  final Duration duration;

  const NativeFlightTakeoff({
    super.key,
    this.size = 48.0,
    this.planeColor,
    this.duration = const Duration(milliseconds: 2000),
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final color = widget.planeColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFF1E88E5));

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
                planeColor: color,
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

    final linePaint = Paint()
      ..color = planeColor.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Ground Horizon Line
    canvas.drawLine(const Offset(2, 21), const Offset(22, 21), linePaint);

    // Airplane Takeoff Translation & Angle
    final px = 2.0 + progress * 18.0;
    final py = 19.0 - progress * 13.0;

    canvas.save();
    canvas.translate(px, py);
    canvas.rotate(-0.4); // Takeoff pitch angle

    final planePaint = Paint()
      ..color = planeColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final planePath = Path()
      ..moveTo(0, -6)
      ..cubicTo(1.5, -6, 2, -4, 2, -1)
      ..lineTo(7, 2)
      ..lineTo(7, 4)
      ..lineTo(2, 3)
      ..lineTo(2, 5)
      ..lineTo(4, 7)
      ..lineTo(4, 8)
      ..lineTo(0, 7)
      ..lineTo(-4, 8)
      ..lineTo(-4, 7)
      ..lineTo(-2, 5)
      ..lineTo(-2, 3)
      ..lineTo(-7, 4)
      ..lineTo(-7, 2)
      ..lineTo(-2, -1)
      ..cubicTo(-2, -4, -1.5, -6, 0, -6)
      ..close();

    canvas.drawPath(planePath, planePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _FlightTakeoffPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.planeColor != planeColor;
}
