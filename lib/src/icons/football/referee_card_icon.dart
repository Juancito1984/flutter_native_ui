import 'package:flutter/material.dart';

/// Icono vectorial de tarjetas de árbitro (Amarilla y Roja).
class RefereeCardIcon extends StatelessWidget {
  final double size;

  const RefereeCardIcon({
    super.key,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: const _RefereeCardPainter(),
      ),
    );
  }
}

class _RefereeCardPainter extends CustomPainter {
  const _RefereeCardPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final yellowCardPaint = Paint()
      ..color = const Color(0xFFFFD600)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final redCardPaint = Paint()
      ..color = const Color(0xFFD50000)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = const Color(0x33000000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    // Yellow Card (Behind, tilted left)
    canvas.save();
    canvas.translate(10, 12);
    canvas.rotate(-0.26); // ~15 deg
    final yellowRect = RRect.fromLTRBR(-5, -8, 5, 8, const Radius.circular(1.5));
    canvas.drawRRect(yellowRect, yellowCardPaint);
    canvas.drawRRect(yellowRect, borderPaint);
    canvas.restore();

    // Red Card (In front, tilted right)
    canvas.save();
    canvas.translate(14, 12);
    canvas.rotate(0.26); // ~15 deg
    final redRect = RRect.fromLTRBR(-5, -8, 5, 8, const Radius.circular(1.5));
    canvas.drawRRect(redRect, redCardPaint);
    canvas.drawRRect(redRect, borderPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
