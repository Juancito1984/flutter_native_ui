import 'package:flutter/material.dart';

/// Icono vectorial bi-tonal de moneda Bitcoin / Cripto.
class BitcoinCryptoIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? secondaryColor;

  const BitcoinCryptoIcon({
    super.key,
    this.size = 24.0,
    this.color,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primary = color ?? (isDark ? theme.colorScheme.onSurface : const Color(0xFFFFB703));
    final accent = secondaryColor ?? (isDark ? theme.colorScheme.primary : theme.colorScheme.secondary);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BitcoinCryptoPainter(
          primaryColor: primary,
          accentColor: accent,
        ),
      ),
    );
  }
}

class _BitcoinCryptoPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _BitcoinCryptoPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final coinStroke = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..isAntiAlias = true;

    final bPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..isAntiAlias = true;

    // Coin Circle (Vibrant Gold Accent)
    canvas.drawCircle(const Offset(12, 12), 9, coinStroke);

    // B Symbol
    final bPath = Path()
      ..moveTo(9, 7)
      ..lineTo(13.5, 7)
      ..cubicTo(15.5, 7, 15.5, 11, 13.5, 11)
      ..lineTo(9, 11)
      ..lineTo(14, 11)
      ..cubicTo(16, 11, 16, 16, 13.5, 16)
      ..lineTo(9, 16)
      ..lineTo(9, 7);
    canvas.drawPath(bPath, bPaint);

    // Vertical double lines
    canvas.drawLine(const Offset(10.5, 5), const Offset(10.5, 18), bPaint..strokeWidth = 1.2);
    canvas.drawLine(const Offset(13, 5), const Offset(13, 18), bPaint..strokeWidth = 1.2);
  }

  @override
  bool shouldRepaint(covariant _BitcoinCryptoPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor || oldDelegate.accentColor != accentColor;
}
