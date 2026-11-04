import 'package:flutter/material.dart';

/// Icono vectorial de Mastercard.
class MastercardIcon extends StatelessWidget {
  final double size;

  const MastercardIcon({
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
        painter: const _MastercardIconPainter(),
      ),
    );
  }
}

class _MastercardIconPainter extends CustomPainter {
  const _MastercardIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = const Color(0xFF222222)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(0, 4, 24, 16),
        const Radius.circular(3),
      ),
      bgPaint,
    );

    final redPaint = Paint()
      ..color = const Color(0xFFEB001B)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final yellowPaint = Paint()
      ..color = const Color(0xFFF79E1B)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final orangePaint = Paint()
      ..color = const Color(0xFFFF5F00)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Red Circle (Left)
    canvas.drawCircle(const Offset(9, 12), 5.5, redPaint);

    // Yellow Circle (Right)
    canvas.drawCircle(const Offset(15, 12), 5.5, yellowPaint);

    // Overlap Area (Orange)
    canvas.save();
    canvas.clipPath(Path()..addOval(const Rect.fromLTWH(3.5, 6.5, 11, 11)));
    canvas.drawCircle(const Offset(15, 12), 5.5, orangePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
