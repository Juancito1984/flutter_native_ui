import 'package:flutter/material.dart';

/// Animación nativa de Pin de Mapa Emitiendo Pulso de Radar GPS.
class NativeRadarPin extends StatefulWidget {
  final double size;
  final Color pinColor;
  final Color pulseColor;
  final Duration duration;

  const NativeRadarPin({
    super.key,
    this.size = 56.0,
    this.pinColor = const Color(0xFFD32F2F),
    this.pulseColor = const Color(0xFFEF5350),
    this.duration = const Duration(milliseconds: 1600),
  });

  @override
  State<NativeRadarPin> createState() => _NativeRadarPinState();
}

class _NativeRadarPinState extends State<NativeRadarPin>
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
              painter: _RadarPinPainter(
                progress: _controller.value,
                pinColor: widget.pinColor,
                pulseColor: widget.pulseColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RadarPinPainter extends CustomPainter {
  final double progress;
  final Color pinColor;
  final Color pulseColor;

  const _RadarPinPainter({
    required this.progress,
    required this.pinColor,
    required this.pulseColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    // Ground Radar Wave
    final r = 2.0 + progress * 10.0;
    final alpha = (1.0 - progress).clamp(0.0, 1.0);

    final wavePaint = Paint()
      ..color = pulseColor.withValues(alpha: alpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..isAntiAlias = true;

    canvas.drawOval(Rect.fromLTRB(12.0 - r, 19.5 - (r * 0.4), 12.0 + r, 19.5 + (r * 0.4)), wavePaint);

    // Map Pin
    final pinPaint = Paint()
      ..color = pinColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final pinPath = Path()
      ..moveTo(12.0, 3.0)
      ..cubicTo(8.5, 3.0, 6.0, 5.5, 6.0, 9.0)
      ..cubicTo(6.0, 13.5, 12.0, 19.5, 12.0, 19.5)
      ..cubicTo(12.0, 19.5, 18.0, 13.5, 18.0, 9.0)
      ..cubicTo(18.0, 5.5, 15.5, 3.0, 12.0, 3.0)
      ..close();
    canvas.drawPath(pinPath, pinPaint);

    // Inner Dot
    canvas.drawCircle(const Offset(12.0, 9.0), 2.0, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant _RadarPinPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.pinColor != pinColor;
}
