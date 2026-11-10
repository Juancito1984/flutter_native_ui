import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de carrito de compras.
class ShoppingCartIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const ShoppingCartIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : theme.colorScheme.primary);
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : const Color(0xFF00E676));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ShoppingCartPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _ShoppingCartPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _ShoppingCartPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final basketStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final wheelFill = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    // Cart Basket Wireframe
    final cartPath = Path()
      ..moveTo(3, 4)
      ..lineTo(6, 4)
      ..lineTo(9, 14)
      ..lineTo(19, 14)
      ..lineTo(21, 7)
      ..lineTo(7, 7);
    canvas.drawPath(cartPath, basketStroke);

    // Wheels (Vibrant Emerald Accent)
    canvas.drawCircle(const Offset(9.5, 18), 2.0, wheelFill);
    canvas.drawCircle(const Offset(17.5, 18), 2.0, wheelFill);
  }

  @override
  bool shouldRepaint(covariant _ShoppingCartPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
