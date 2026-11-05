import 'package:flutter/material.dart';

/// Icono vectorial de alcancía/cerdito de ahorro.
class PiggyBankIcon extends StatelessWidget {
  final double size;
  final Color pigColor;

  const PiggyBankIcon({
    super.key,
    this.size = 24.0,
    this.pigColor = const Color(0xFFF06292),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _PiggyBankPainter(pigColor: pigColor),
      ),
    );
  }
}

class _PiggyBankPainter extends CustomPainter {
  final Color pigColor;

  const _PiggyBankPainter({required this.pigColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final pigPaint = Paint()
      ..color = pigColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final detailPaint = Paint()..color = const Color(0xFF37474F);
    final coinPaint = Paint()..color = const Color(0xFFFFD54F);

    // Coin dropping in
    canvas.drawCircle(const Offset(12, 4), 2.2, coinPaint);

    // Pig Body
    canvas.drawCircle(const Offset(12, 13), 6.5, pigPaint);

    // Snout
    canvas.drawRRect(
      RRect.fromLTRBR(17, 12, 21, 15, const Radius.circular(1.5)),
      pigPaint,
    );

    // Ear
    final earPath = Path()
      ..moveTo(8, 8)
      ..lineTo(10, 4)
      ..lineTo(12, 8)
      ..close();
    canvas.drawPath(earPath, pigPaint);

    // Eye
    canvas.drawCircle(const Offset(15, 11), 0.8, detailPaint);

    // Legs
    final legPaint = Paint()
      ..color = pigColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(const Rect.fromLTRB(8, 18, 10, 21), legPaint);
    canvas.drawRect(const Rect.fromLTRB(14, 18, 16, 21), legPaint);
  }

  @override
  bool shouldRepaint(covariant _PiggyBankPainter oldDelegate) =>
      oldDelegate.pigColor != pigColor;
}
