import 'package:flutter/material.dart';

/// Icono vectorial de velocímetro de automóvil.
class SpeedometerIcon extends StatelessWidget {
  final double size;
  final Color meterColor;

  const SpeedometerIcon({
    super.key,
    this.size = 24.0,
    this.meterColor = const Color(0xFF00BCD4),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _SpeedometerPainter(meterColor: meterColor),
      ),
    );
  }
}

class _SpeedometerPainter extends CustomPainter {
  final Color meterColor;

  const _SpeedometerPainter({required this.meterColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final rimPaint = Paint()
      ..color = meterColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final needlePaint = Paint()
      ..color = const Color(0xFFE53935)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    // Meter Arc Gauge
    canvas.drawArc(
      const Rect.fromLTWH(3, 4, 18, 18),
      2.35, // ~135 deg
      4.71, // ~270 deg
      false,
      rimPaint,
    );

    // Needle pointed right
    canvas.drawLine(const Offset(12, 13), const Offset(17, 8), needlePaint);
    canvas.drawCircle(const Offset(12, 13), 2.0, Paint()..color = meterColor);
  }

  @override
  bool shouldRepaint(covariant _SpeedometerPainter oldDelegate) =>
      oldDelegate.meterColor != meterColor;
}
