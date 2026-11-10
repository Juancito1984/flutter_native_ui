import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de comida rápida (hamburguesa/pizza).
class BurgerPizzaIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const BurgerPizzaIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFFFB300));
    final pattyAccent = secondaryColor ?? const Color(0xFFD32F2F);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BurgerPizzaPainter(
          primaryColor: primary,
          accentColor: pattyAccent,
        ),
      ),
    );
  }
}

class _BurgerPizzaPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _BurgerPizzaPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bunPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final pattyStroke = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Top Bun Dome (Vibrant Golden Bun)
    final bunTop = Path()
      ..moveTo(4, 10)
      ..cubicTo(4, 5, 20, 5, 20, 10)
      ..close();
    canvas.drawPath(bunTop, bunPaint);

    // Patty Line (Vibrant Crimson Accent)
    canvas.drawLine(const Offset(3, 13), const Offset(21, 13), pattyStroke);

    // Bottom Bun
    final bunBot = RRect.fromRectAndRadius(
      const Rect.fromLTWH(4, 16, 16, 4),
      const Radius.circular(2),
    );
    canvas.drawRRect(bunBot, bunPaint);
  }

  @override
  bool shouldRepaint(covariant _BurgerPizzaPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
