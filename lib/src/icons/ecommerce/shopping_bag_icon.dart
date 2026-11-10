import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de bolsa de compras para comercio electrónico.
class ShoppingBagIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;
  final Color? bagColor;
  final Color? handleColor;

  const ShoppingBagIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
    this.bagColor,
    this.handleColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? bagColor ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFAB47BC));
    final accent = secondaryColor ?? handleColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFFFFCA28));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ShoppingBagPainter(
          bagColor: primary,
          handleColor: accent,
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
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Handles (Vibrant Gold/Amber Accent)
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
