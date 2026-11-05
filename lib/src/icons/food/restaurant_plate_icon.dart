import 'package:flutter/material.dart';

/// Icono vectorial de plato de restaurante con cubiertos (tenedor y cuchillo).
class RestaurantPlateIcon extends StatelessWidget {
  final double size;
  final Color plateColor;

  const RestaurantPlateIcon({
    super.key,
    this.size = 24.0,
    this.plateColor = const Color(0xFF009688),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _RestaurantPlatePainter(plateColor: plateColor),
      ),
    );
  }
}

class _RestaurantPlatePainter extends CustomPainter {
  final Color plateColor;

  const _RestaurantPlatePainter({required this.plateColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final platePaint = Paint()
      ..color = plateColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    final cutleryPaint = Paint()
      ..color = plateColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Plate Circle
    canvas.drawCircle(const Offset(12, 12), 8.5, platePaint);

    // Fork (Left)
    final forkPath = Path()
      ..moveTo(2, 4)
      ..lineTo(2, 20)
      ..moveTo(0.5, 4)
      ..lineTo(0.5, 9)
      ..moveTo(3.5, 4)
      ..lineTo(3.5, 9);
    canvas.drawPath(
      forkPath,
      Paint()
        ..color = plateColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );

    // Knife (Right)
    final knifePath = Path()
      ..moveTo(22, 4)
      ..cubicTo(20, 6, 20, 12, 22, 12)
      ..lineTo(22, 20)
      ..close();
    canvas.drawPath(knifePath, cutleryPaint);
  }

  @override
  bool shouldRepaint(covariant _RestaurantPlatePainter oldDelegate) =>
      oldDelegate.plateColor != plateColor;
}
