import 'package:flutter/material.dart';

/// Icono vectorial de etiqueta de oferta/descuento.
class TagDiscountIcon extends StatelessWidget {
  final double size;
  final Color tagColor;

  const TagDiscountIcon({
    super.key,
    this.size = 24.0,
    this.tagColor = const Color(0xFFE53935),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _TagDiscountPainter(tagColor: tagColor),
      ),
    );
  }
}

class _TagDiscountPainter extends CustomPainter {
  final Color tagColor;

  const _TagDiscountPainter({required this.tagColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final tagPaint = Paint()
      ..color = tagColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final holePaint = Paint()..color = Colors.white;

    canvas.save();
    canvas.translate(12, 12);
    canvas.rotate(-0.785398); // -45 deg

    // Tag Shape
    final tagPath = Path()
      ..moveTo(-9, -4)
      ..lineTo(2, -4)
      ..lineTo(9, 0)
      ..lineTo(2, 4)
      ..lineTo(-9, 4)
      ..close();
    canvas.drawPath(tagPath, tagPaint);

    // Tag Hole
    canvas.drawCircle(const Offset(-6, 0), 1.5, holePaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _TagDiscountPainter oldDelegate) =>
      oldDelegate.tagColor != tagColor;
}
