import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Animación nativa de Camión de Envíos Avanzando en Tiempo Real.
class NativeTruckMoving extends StatefulWidget {
  final double size;
  final Color truckColor;
  final Duration duration;

  const NativeTruckMoving({
    super.key,
    this.size = 64.0,
    this.truckColor = const Color(0xFF1565C0),
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<NativeTruckMoving> createState() => _NativeTruckMovingState();
}

class _NativeTruckMovingState extends State<NativeTruckMoving>
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
            width: widget.size * 1.5,
            height: widget.size,
            child: CustomPaint(
              painter: _TruckMovingPainter(
                progress: _controller.value,
                truckColor: widget.truckColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TruckMovingPainter extends CustomPainter {
  final double progress;
  final Color truckColor;

  const _TruckMovingPainter({
    required this.progress,
    required this.truckColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.height / 24.0;
    canvas.scale(scale, scale);

    final truckPaint = Paint()
      ..color = truckColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final strokePaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..isAntiAlias = true;

    // Moving bounce offset
    final bounceY = math.sin(progress * 4 * math.pi) * 0.4;

    canvas.save();
    canvas.translate(0, bounceY);

    // Cargo Body
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTRB(2.0, 7.0, 18.0, 17.0), const Radius.circular(2.0)),
      truckPaint,
    );

    // Cabin
    final cabinPath = Path()
      ..moveTo(18.0, 10.0)
      ..lineTo(23.0, 11.0)
      ..lineTo(24.0, 17.0)
      ..lineTo(18.0, 17.0)
      ..close();
    canvas.drawPath(cabinPath, truckPaint..color = truckColor.withValues(alpha: 0.9));

    // Rotating Wheels
    final wheelAngle = progress * 4 * math.pi;

    void drawWheel(double cx, double cy) {
      canvas.save();
      canvas.translate(cx, cy);
      canvas.drawCircle(Offset.zero, 2.5, Paint()..color = Colors.black87);
      canvas.drawCircle(Offset.zero, 1.2, Paint()..color = Colors.white);
      canvas.rotate(wheelAngle);
      canvas.drawLine(const Offset(-2.0, 0), const Offset(2.0, 0), strokePaint..strokeWidth = 0.8);
      canvas.restore();
    }

    drawWheel(7.0, 17.5);
    drawWheel(14.0, 17.5);
    drawWheel(21.0, 17.5);

    canvas.restore();

    // Road Motion Lines
    final lineX = (1.0 - progress) * 30.0;
    canvas.drawLine(Offset(lineX - 10, 21.0), Offset(lineX, 21.0), Paint()..color = Colors.grey..strokeWidth = 1.2);
  }

  @override
  bool shouldRepaint(covariant _TruckMovingPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.truckColor != truckColor;
}
