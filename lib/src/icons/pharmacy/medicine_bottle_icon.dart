import 'package:flutter/material.dart';

/// Icono vectorial de frasco/jarabe de medicina con etiqueta.
class MedicineBottleIcon extends StatelessWidget {
  final double size;
  final Color bottleColor;
  final Color capColor;

  const MedicineBottleIcon({
    super.key,
    this.size = 24.0,
    this.bottleColor = const Color(0xFF009688),
    this.capColor = const Color(0xFF004D40),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _MedicineBottlePainter(
          bottleColor: bottleColor,
          capColor: capColor,
        ),
      ),
    );
  }
}

class _MedicineBottlePainter extends CustomPainter {
  final Color bottleColor;
  final Color capColor;

  const _MedicineBottlePainter({
    required this.bottleColor,
    required this.capColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bottlePaint = Paint()
      ..color = bottleColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final capPaint = Paint()
      ..color = capColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final labelPaint = Paint()..color = const Color(0xFFFFFFFF);
    final crossPaint = Paint()..color = const Color(0xFFE53935);

    // Cap
    canvas.drawRRect(
      RRect.fromLTRBR(8, 3, 16, 6, const Radius.circular(1.0)),
      capPaint,
    );

    // Neck
    canvas.drawRect(const Rect.fromLTRB(9.5, 6, 14.5, 8), capPaint);

    // Bottle Body
    final bodyRect = RRect.fromLTRBR(6, 8, 18, 21, const Radius.circular(2.5));
    canvas.drawRRect(bodyRect, bottlePaint);

    // White Label
    final labelRect = RRect.fromLTRBR(8, 11, 16, 18, const Radius.circular(1.0));
    canvas.drawRRect(labelRect, labelPaint);

    // Mini Red Cross on Label
    canvas.drawRect(const Rect.fromLTRB(11.3, 12.5, 12.7, 16.5), crossPaint);
    canvas.drawRect(const Rect.fromLTRB(10, 13.8, 14, 15.2), crossPaint);
  }

  @override
  bool shouldRepaint(covariant _MedicineBottlePainter oldDelegate) =>
      oldDelegate.bottleColor != bottleColor || oldDelegate.capColor != capColor;
}
