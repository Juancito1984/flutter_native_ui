import 'package:flutter/material.dart';

/// Icono vectorial de carrito de compras para comercio electrónico.
class ShoppingCartIcon extends StatelessWidget {
  final double size;
  final Color cartColor;

  const ShoppingCartIcon({
    super.key,
    this.size = 24.0,
    this.cartColor = const Color(0xFF1E88E5),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ShoppingCartPainter(cartColor: cartColor),
      ),
    );
  }
}

class _ShoppingCartPainter extends CustomPainter {
  final Color cartColor;

  const _ShoppingCartPainter({required this.cartColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cartPaint = Paint()
      ..color = cartColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final wheelPaint = Paint()
      ..color = cartColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Basket & Handle
    final cartPath = Path()
      ..moveTo(2, 3)
      ..lineTo(5, 3)
      ..lineTo(8, 14)
      ..lineTo(19, 14)
      ..lineTo(21, 6)
      ..lineTo(6, 6);
    canvas.drawPath(cartPath, cartPaint);

    // Wheels
    canvas.drawCircle(const Offset(9, 19), 2.0, wheelPaint);
    canvas.drawCircle(const Offset(18, 19), 2.0, wheelPaint);
  }

  @override
  bool shouldRepaint(covariant _ShoppingCartPainter oldDelegate) =>
      oldDelegate.cartColor != cartColor;
}
