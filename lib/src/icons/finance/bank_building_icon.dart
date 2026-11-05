import 'package:flutter/material.dart';

/// Icono vectorial de edificio bancario.
class BankBuildingIcon extends StatelessWidget {
  final double size;
  final Color bankColor;

  const BankBuildingIcon({
    super.key,
    this.size = 24.0,
    this.bankColor = const Color(0xFF1565C0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BankBuildingPainter(bankColor: bankColor),
      ),
    );
  }
}

class _BankBuildingPainter extends CustomPainter {
  final Color bankColor;

  const _BankBuildingPainter({required this.bankColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bankPaint = Paint()
      ..color = bankColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Roof Triangle
    final roof = Path()
      ..moveTo(12, 3)
      ..lineTo(2, 9)
      ..lineTo(22, 9)
      ..close();
    canvas.drawPath(roof, bankPaint);

    // Pillars
    canvas.drawRect(const Rect.fromLTRB(4, 10, 6.5, 18), bankPaint);
    canvas.drawRect(const Rect.fromLTRB(9, 10, 11.5, 18), bankPaint);
    canvas.drawRect(const Rect.fromLTRB(13.5, 10, 16, 18), bankPaint);
    canvas.drawRect(const Rect.fromLTRB(17.5, 10, 20, 18), bankPaint);

    // Base Steps
    canvas.drawRect(const Rect.fromLTRB(2, 19, 22, 21), bankPaint);
  }

  @override
  bool shouldRepaint(covariant _BankBuildingPainter oldDelegate) =>
      oldDelegate.bankColor != bankColor;
}
