import 'package:flutter/material.dart';

/// Icono vectorial de camión de entrega expreso / delivery.
class DeliveryTruckIcon extends StatelessWidget {
  final double size;
  final Color bodyColor;

  const DeliveryTruckIcon({
    super.key,
    this.size = 24.0,
    this.bodyColor = const Color(0xFF43A047),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _DeliveryTruckPainter(bodyColor: bodyColor),
      ),
    );
  }
}

class _DeliveryTruckPainter extends CustomPainter {
  final Color bodyColor;

  const _DeliveryTruckPainter({required this.bodyColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bodyPaint = Paint()
      ..color = bodyColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final wheelPaint = Paint()
      ..color = const Color(0xFF37474F)
      ..style = PaintingStyle.fill;

    final windowPaint = Paint()..color = const Color(0xFF81D4FA);

    // Box Body
    canvas.drawRRect(
      RRect.fromLTRBR(1, 7, 15, 17, const Radius.circular(1.5)),
      bodyPaint,
    );

    // Cabin
    final cabinPath = Path()
      ..moveTo(15, 17)
      ..lineTo(15, 10)
      ..lineTo(19, 10)
      ..lineTo(22, 14)
      ..lineTo(22, 17)
      ..close();
    canvas.drawPath(cabinPath, bodyPaint);

    // Window
    final windowPath = Path()
      ..moveTo(17, 11)
      ..lineTo(19, 11)
      ..lineTo(21, 13.5)
      ..lineTo(17, 13.5)
      ..close();
    canvas.drawPath(windowPath, windowPaint);

    // Wheels
    canvas.drawCircle(const Offset(6, 17.5), 2.5, wheelPaint);
    canvas.drawCircle(const Offset(18, 17.5), 2.5, wheelPaint);
  }

  @override
  bool shouldRepaint(covariant _DeliveryTruckPainter oldDelegate) =>
      oldDelegate.bodyColor != bodyColor;
}
