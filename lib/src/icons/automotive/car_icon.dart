import 'package:flutter/material.dart';

/// Icono vectorial de automóvil para automotriz y movilidad.
class CarIcon extends StatelessWidget {
  final double size;
  final Color carColor;

  const CarIcon({
    super.key,
    this.size = 24.0,
    this.carColor = const Color(0xFF1E88E5),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CarPainter(carColor: carColor),
      ),
    );
  }
}

class _CarPainter extends CustomPainter {
  final Color carColor;

  const _CarPainter({required this.carColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final carPaint = Paint()
      ..color = carColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final wheelPaint = Paint()
      ..color = const Color(0xFF263238)
      ..style = PaintingStyle.fill;

    final windowPaint = Paint()..color = const Color(0xFF81D4FA);

    // Car Roof / Windows Body
    final roofPath = Path()
      ..moveTo(6, 12)
      ..lineTo(8.5, 7)
      ..lineTo(15.5, 7)
      ..lineTo(18, 12)
      ..close();
    canvas.drawPath(roofPath, windowPaint);

    // Main Car Body
    final bodyPath = Path()
      ..moveTo(2, 12)
      ..lineTo(22, 12)
      ..cubicTo(23, 12, 23, 16, 22, 16)
      ..lineTo(2, 16)
      ..cubicTo(1, 16, 1, 12, 2, 12)
      ..close();
    canvas.drawPath(bodyPath, carPaint);

    // Wheels
    canvas.drawCircle(const Offset(6, 16.5), 2.5, wheelPaint);
    canvas.drawCircle(const Offset(18, 16.5), 2.5, wheelPaint);
  }

  @override
  bool shouldRepaint(covariant _CarPainter oldDelegate) =>
      oldDelegate.carColor != carColor;
}
