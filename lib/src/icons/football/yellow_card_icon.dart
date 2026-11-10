import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de tarjeta amarilla reglamentaria.
class YellowCardIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const YellowCardIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final cardColor = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFFFCA28));

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _YellowCardPainter(cardColor: cardColor),
      ),
    );
  }
}

class _YellowCardPainter extends CustomPainter {
  final Color cardColor;

  const _YellowCardPainter({required this.cardColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final cardPaint = Paint()
      ..color = cardColor
      ..style = PaintingStyle.fill;

    final cardRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(6, 3, 12, 18),
      const Radius.circular(2),
    );
    canvas.drawRRect(cardRect, cardPaint);
  }

  @override
  bool shouldRepaint(covariant _YellowCardPainter oldDelegate) =>
      oldDelegate.cardColor != cardColor;
}
