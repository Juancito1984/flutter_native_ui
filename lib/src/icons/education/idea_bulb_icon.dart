import 'package:flutter/material.dart';

/// Icono vectorial de foco de idea / creatividad.
class IdeaBulbIcon extends StatelessWidget {
  final double size;
  final Color bulbColor;

  const IdeaBulbIcon({
    super.key,
    this.size = 24.0,
    this.bulbColor = const Color(0xFFFFC107),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _IdeaBulbPainter(bulbColor: bulbColor),
      ),
    );
  }
}

class _IdeaBulbPainter extends CustomPainter {
  final Color bulbColor;

  const _IdeaBulbPainter({required this.bulbColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bulbPaint = Paint()
      ..color = bulbColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final basePaint = Paint()
      ..color = const Color(0xFF78909C)
      ..style = PaintingStyle.fill;

    // Bulb Glass
    final bulbPath = Path()
      ..moveTo(12, 3)
      ..cubicTo(7, 3, 5, 7, 5, 11)
      ..cubicTo(5, 14, 8, 15.5, 9, 17)
      ..lineTo(15, 17)
      ..cubicTo(16, 15.5, 19, 14, 19, 11)
      ..cubicTo(19, 7, 17, 3, 12, 3)
      ..close();
    canvas.drawPath(bulbPath, bulbPaint);

    // Screw Base
    canvas.drawRect(const Rect.fromLTRB(9, 18, 15, 20), basePaint);
    canvas.drawRRect(
      RRect.fromLTRBR(10, 20, 14, 22, const Radius.circular(1)),
      basePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _IdeaBulbPainter oldDelegate) =>
      oldDelegate.bulbColor != bulbColor;
}
