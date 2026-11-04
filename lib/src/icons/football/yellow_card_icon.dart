import 'package:flutter/material.dart';

/// Icono vectorial individual de tarjeta amarilla de fútbol.
class YellowCardIcon extends StatelessWidget {
  final double size;

  const YellowCardIcon({
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
        painter: const _YellowCardPainter(),
      ),
    );
  }
}

class _YellowCardPainter extends CustomPainter {
  const _YellowCardPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cardPaint = Paint()
      ..color = const Color(0xFFFFD600)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = const Color(0xFFF57F17)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final cardRect = RRect.fromLTRBR(6, 3, 18, 21, const Radius.circular(2.0));
    canvas.drawRRect(cardRect, cardPaint);
    canvas.drawRRect(cardRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
