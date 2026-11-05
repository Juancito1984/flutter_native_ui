import 'package:flutter/material.dart';

/// Icono vectorial de moneda Bitcoin/Cripto.
class BitcoinCryptoIcon extends StatelessWidget {
  final double size;

  const BitcoinCryptoIcon({
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
        painter: const _BitcoinCryptoPainter(),
      ),
    );
  }
}

class _BitcoinCryptoPainter extends CustomPainter {
  const _BitcoinCryptoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final coinPaint = Paint()
      ..color = const Color(0xFFFF9100)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final symbolPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Coin Circle
    canvas.drawCircle(const Offset(12, 12), 10, coinPaint);

    // Bitcoin 'B' Symbol
    final bPath = Path()
      ..moveTo(9, 7)
      ..lineTo(14, 7)
      ..cubicTo(16, 7, 16, 11, 14, 11)
      ..lineTo(9, 11)
      ..moveTo(9, 11)
      ..lineTo(14.5, 11)
      ..cubicTo(16.5, 11, 16.5, 16, 14, 16)
      ..lineTo(9, 16)
      ..moveTo(9, 6)
      ..lineTo(9, 17);
    canvas.drawPath(bPath, symbolPaint);

    // Vertical double bars
    canvas.drawLine(const Offset(10.5, 5), const Offset(10.5, 7), symbolPaint);
    canvas.drawLine(const Offset(13, 5), const Offset(13, 7), symbolPaint);
    canvas.drawLine(const Offset(10.5, 16), const Offset(10.5, 18), symbolPaint);
    canvas.drawLine(const Offset(13, 16), const Offset(13, 18), symbolPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
