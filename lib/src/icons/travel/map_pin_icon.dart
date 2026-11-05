import 'package:flutter/material.dart';

/// Icono vectorial de pin de ubicación en mapa.
class MapPinIcon extends StatelessWidget {
  final double size;
  final Color pinColor;

  const MapPinIcon({
    super.key,
    this.size = 24.0,
    this.pinColor = const Color(0xFFE53935),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _MapPinPainter(pinColor: pinColor),
      ),
    );
  }
}

class _MapPinPainter extends CustomPainter {
  final Color pinColor;

  const _MapPinPainter({required this.pinColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final pinPaint = Paint()
      ..color = pinColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final dotPaint = Paint()..color = Colors.white;

    final path = Path()
      ..moveTo(12, 2)
      ..cubicTo(7, 2, 4, 6, 4, 10.5)
      ..cubicTo(4, 16, 12, 22, 12, 22)
      ..cubicTo(12, 22, 20, 16, 20, 10.5)
      ..cubicTo(20, 6, 17, 2, 12, 2)
      ..close();

    canvas.drawPath(path, pinPaint);
    canvas.drawCircle(const Offset(12, 9.5), 3.0, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _MapPinPainter oldDelegate) =>
      oldDelegate.pinColor != pinColor;
}
