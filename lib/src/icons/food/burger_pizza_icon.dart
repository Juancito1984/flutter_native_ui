import 'package:flutter/material.dart';

/// Icono vectorial de comida rápida (Hamburguesa / Pizza).
class BurgerPizzaIcon extends StatelessWidget {
  final double size;
  final Color bunColor;
  final Color pattyColor;

  const BurgerPizzaIcon({
    super.key,
    this.size = 24.0,
    this.bunColor = const Color(0xFFFFB300),
    this.pattyColor = const Color(0xFF6D4C41),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BurgerPizzaPainter(
          bunColor: bunColor,
          pattyColor: pattyColor,
        ),
      ),
    );
  }
}

class _BurgerPizzaPainter extends CustomPainter {
  final Color bunColor;
  final Color pattyColor;

  const _BurgerPizzaPainter({
    required this.bunColor,
    required this.pattyColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bunPaint = Paint()
      ..color = bunColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final pattyPaint = Paint()
      ..color = pattyColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final cheesePaint = Paint()..color = const Color(0xFFFFD54F);

    // Top Bun
    final topBun = Path()
      ..moveTo(3, 11)
      ..cubicTo(3, 5, 21, 5, 21, 11)
      ..close();
    canvas.drawPath(topBun, bunPaint);

    // Cheese
    final cheese = Path()
      ..moveTo(3, 12)
      ..lineTo(21, 12)
      ..lineTo(19, 14.5)
      ..lineTo(15, 12.5)
      ..lineTo(10, 14.5)
      ..lineTo(5, 12.5)
      ..close();
    canvas.drawPath(cheese, cheesePaint);

    // Patty
    canvas.drawRRect(
      RRect.fromLTRBR(3, 14, 21, 17, const Radius.circular(1.5)),
      pattyPaint,
    );

    // Bottom Bun
    canvas.drawRRect(
      RRect.fromLTRBR(3.5, 18, 20.5, 21, const Radius.circular(2)),
      bunPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _BurgerPizzaPainter oldDelegate) =>
      oldDelegate.bunColor != bunColor || oldDelegate.pattyColor != pattyColor;
}
