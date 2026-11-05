import 'package:flutter/material.dart';

/// Icono vectorial de llave inteligente de coche.
class CarKeyIcon extends StatelessWidget {
  final double size;
  final Color fobColor;

  const CarKeyIcon({
    super.key,
    this.size = 24.0,
    this.fobColor = const Color(0xFF37474F),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _CarKeyPainter(fobColor: fobColor),
      ),
    );
  }
}

class _CarKeyPainter extends CustomPainter {
  final Color fobColor;

  const _CarKeyPainter({required this.fobColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final fobPaint = Paint()
      ..color = fobColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final bladePaint = Paint()
      ..color = const Color(0xFFB0BEC5)
      ..style = PaintingStyle.fill;

    final buttonPaint = Paint()..color = const Color(0xFF90A4AE);

    // Key Fob Body
    final fobRect = RRect.fromLTRBR(6, 2, 18, 14, const Radius.circular(3.5));
    canvas.drawRRect(fobRect, fobPaint);

    // Fob Buttons
    canvas.drawCircle(const Offset(12, 5.5), 1.5, buttonPaint);
    canvas.drawCircle(const Offset(12, 10), 1.5, buttonPaint);

    // Metal Blade extending down
    canvas.drawRect(const Rect.fromLTRB(10.5, 14, 13.5, 22), bladePaint);
    canvas.drawRect(const Rect.fromLTRB(13.5, 17, 15, 19), bladePaint);
  }

  @override
  bool shouldRepaint(covariant _CarKeyPainter oldDelegate) =>
      oldDelegate.fobColor != fobColor;
}
