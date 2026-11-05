import 'package:flutter/material.dart';

/// Icono vectorial de cama de hotel / hospedaje.
class HotelBedIcon extends StatelessWidget {
  final double size;
  final Color bedColor;

  const HotelBedIcon({
    super.key,
    this.size = 24.0,
    this.bedColor = const Color(0xFF3F51B5),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _HotelBedPainter(bedColor: bedColor),
      ),
    );
  }
}

class _HotelBedPainter extends CustomPainter {
  final Color bedColor;

  const _HotelBedPainter({required this.bedColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final framePaint = Paint()
      ..color = const Color(0xFF546E7A)
      ..style = PaintingStyle.fill;

    final bedPaint = Paint()
      ..color = bedColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final pillowPaint = Paint()..color = const Color(0xFFECEFF1);

    // Headboard & Posts
    canvas.drawRect(const Rect.fromLTRB(2, 6, 4, 20), framePaint);
    canvas.drawRect(const Rect.fromLTRB(20, 13, 22, 20), framePaint);

    // Mattress & Blanket
    final mattress = RRect.fromLTRBR(4, 13, 21, 18, const Radius.circular(1.5));
    canvas.drawRRect(mattress, bedPaint);

    // Pillow
    canvas.drawRRect(
      RRect.fromLTRBR(5, 9, 10, 13, const Radius.circular(1)),
      pillowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _HotelBedPainter oldDelegate) =>
      oldDelegate.bedColor != bedColor;
}
