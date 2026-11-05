import 'package:flutter/material.dart';

/// Icono vectorial de motocicleta de delivery/reparto.
class DeliveryMotorcycleIcon extends StatelessWidget {
  final double size;
  final Color bikeColor;
  final Color boxColor;

  const DeliveryMotorcycleIcon({
    super.key,
    this.size = 24.0,
    this.bikeColor = const Color(0xFF1E88E5),
    this.boxColor = const Color(0xFFE53935),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _DeliveryMotorcyclePainter(
          bikeColor: bikeColor,
          boxColor: boxColor,
        ),
      ),
    );
  }
}

class _DeliveryMotorcyclePainter extends CustomPainter {
  final Color bikeColor;
  final Color boxColor;

  const _DeliveryMotorcyclePainter({
    required this.bikeColor,
    required this.boxColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bikePaint = Paint()
      ..color = bikeColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final boxPaint = Paint()
      ..color = boxColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final wheelPaint = Paint()
      ..color = const Color(0xFF37474F)
      ..style = PaintingStyle.fill;

    // Delivery Box (Rear)
    canvas.drawRRect(
      RRect.fromLTRBR(1, 6, 8, 14, const Radius.circular(1.5)),
      boxPaint,
    );

    // Motorcycle Frame & Handlebar
    final framePaint = Paint()
      ..color = bikeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;
    canvas.drawLine(const Offset(8, 14), const Offset(16, 12), framePaint);
    canvas.drawLine(const Offset(16, 12), const Offset(18, 8), framePaint);

    // Body
    canvas.drawRRect(
      RRect.fromLTRBR(9, 11, 17, 15, const Radius.circular(2)),
      bikePaint,
    );

    // Wheels
    canvas.drawCircle(const Offset(5, 17.5), 3.0, wheelPaint);
    canvas.drawCircle(const Offset(18, 17.5), 3.0, wheelPaint);
  }

  @override
  bool shouldRepaint(covariant _DeliveryMotorcyclePainter oldDelegate) =>
      oldDelegate.bikeColor != bikeColor || oldDelegate.boxColor != boxColor;
}
