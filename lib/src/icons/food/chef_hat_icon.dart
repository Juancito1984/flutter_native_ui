import 'package:flutter/material.dart';

/// Icono vectorial de gorro de chef.
class ChefHatIcon extends StatelessWidget {
  final double size;
  final Color hatColor;

  const ChefHatIcon({
    super.key,
    this.size = 24.0,
    this.hatColor = const Color(0xFFECEFF1),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ChefHatPainter(hatColor: hatColor),
      ),
    );
  }
}

class _ChefHatPainter extends CustomPainter {
  final Color hatColor;

  const _ChefHatPainter({required this.hatColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final hatPaint = Paint()
      ..color = hatColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final borderPaint = Paint()
      ..color = const Color(0xFF78909C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Puff Top
    canvas.drawCircle(const Offset(12, 8), 5.5, hatPaint);
    canvas.drawCircle(const Offset(7, 10), 4.5, hatPaint);
    canvas.drawCircle(const Offset(17, 10), 4.5, hatPaint);

    // Band Base
    final bandRect = RRect.fromLTRBR(6, 14, 18, 20, const Radius.circular(1.0));
    canvas.drawRRect(bandRect, hatPaint);
    canvas.drawRRect(bandRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _ChefHatPainter oldDelegate) =>
      oldDelegate.hatColor != hatColor;
}
