import 'package:flutter/material.dart';

/// Icono vectorial de bolsa de compras para comercio electrónico.
class ShoppingBagIcon extends StatelessWidget {
  final double size;
  final Color bagColor;
  final Color handleColor;

  const ShoppingBagIcon({
    super.key,
    this.size = 24.0,
    this.bagColor = const Color(0xFFAB47BC),
    this.handleColor = const Color(0xFF6A1B9A),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ShoppingBagPainter(
          bagColor: bagColor,
          handleColor: handleColor,
        ),
      ),
    );
  }
}

class _ShoppingBagPainter extends CustomPainter {
  final Color bagColor;
  final Color handleColor;

  const _ShoppingBagPainter({
    required this.bagColor,
    required this.handleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bagPaint = Paint()
      ..color = bagColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final handlePaint = Paint()
      ..color = handleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Handles
    final handlePath = Path()
      ..moveTo(9, 8)
      ..cubicTo(9, 4, 15, 4, 15, 8);
    canvas.drawPath(handlePath, handlePaint);

    // Bag Body
    final bagPath = Path()
      ..moveTo(4.5, 7)
      ..lineTo(19.5, 7)
      ..lineTo(21, 21)
      ..lineTo(3, 21)
      ..close();
    canvas.drawPath(bagPath, bagPaint);
  }

  @override
  bool shouldRepaint(covariant _ShoppingBagPainter oldDelegate) =>
      oldDelegate.bagColor != bagColor || oldDelegate.handleColor != handleColor;
}
