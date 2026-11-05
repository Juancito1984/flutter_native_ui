import 'package:flutter/material.dart';

/// Icono vectorial de avión para viajes y turismo.
class AirplaneIcon extends StatelessWidget {
  final double size;
  final Color planeColor;

  const AirplaneIcon({
    super.key,
    this.size = 24.0,
    this.planeColor = const Color(0xFF0288D1),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _AirplanePainter(planeColor: planeColor),
      ),
    );
  }
}

class _AirplanePainter extends CustomPainter {
  final Color planeColor;

  const _AirplanePainter({required this.planeColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final planePaint = Paint()
      ..color = planeColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.save();
    canvas.translate(12, 12);
    canvas.rotate(-0.785398); // -45 deg

    final planePath = Path()
      ..moveTo(0, -10)
      ..cubicTo(2, -10, 3, -6, 3, -2)
      ..lineTo(10, 3)
      ..lineTo(10, 6)
      ..lineTo(3, 4)
      ..lineTo(3, 8)
      ..lineTo(6, 10)
      ..lineTo(6, 12)
      ..lineTo(0, 10)
      ..lineTo(-6, 12)
      ..lineTo(-6, 10)
      ..lineTo(-3, 8)
      ..lineTo(-3, 4)
      ..lineTo(-10, 6)
      ..lineTo(-10, 3)
      ..lineTo(-3, -2)
      ..cubicTo(-3, -6, -2, -10, 0, -10)
      ..close();

    canvas.drawPath(planePath, planePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _AirplanePainter oldDelegate) =>
      oldDelegate.planeColor != planeColor;
}
