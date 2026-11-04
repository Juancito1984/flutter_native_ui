import 'package:flutter/material.dart';

/// Icono vectorial individual de tarjeta roja de fútbol.
class RedCardIcon extends StatelessWidget {
  final double size;

  const RedCardIcon({
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
        painter: const _RedCardPainter(),
      ),
    );
  }
}

class _RedCardPainter extends CustomPainter {
  const _RedCardPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cardPaint = Paint()
      ..color = const Color(0xFFD50000)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = const Color(0xFF900000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final cardRect = RRect.fromLTRBR(6, 3, 18, 21, const Radius.circular(2.0));
    canvas.drawRRect(cardRect, cardPaint);
    canvas.drawRRect(cardRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
