import 'package:flutter/material.dart';

/// Icono vectorial oficial de Apple (Manzana).
class AppleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const AppleIcon({
    super.key,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = color ?? Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ApplePainter(color: activeColor),
      ),
    );
  }
}

class _ApplePainter extends CustomPainter {
  final Color color;

  const _ApplePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final applePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Apple Body
    final path = Path()
      ..moveTo(12.0, 5.0)
      ..cubicTo(10.5, 5.0, 9.0, 6.0, 7.8, 6.0)
      ..cubicTo(6.2, 6.0, 4.5, 4.8, 3.0, 6.5)
      ..cubicTo(1.0, 9.0, 1.2, 14.0, 3.5, 18.0)
      ..cubicTo(4.6, 20.0, 6.0, 22.0, 8.0, 22.0)
      ..cubicTo(9.8, 22.0, 10.4, 20.8, 12.5, 20.8)
      ..cubicTo(14.5, 20.8, 15.1, 22.0, 17.0, 22.0)
      ..cubicTo(19.0, 22.0, 20.3, 20.0, 21.4, 18.0)
      ..cubicTo(22.7, 15.6, 23.2, 13.5, 23.3, 13.4)
      ..cubicTo(23.1, 13.3, 19.5, 11.8, 19.5, 7.8)
      ..cubicTo(19.5, 4.5, 22.1, 3.0, 22.2, 2.9)
      ..cubicTo(20.6, 0.6, 18.1, 0.4, 17.2, 0.3)
      ..cubicTo(15.0, 0.1, 13.0, 1.6, 12.0, 1.6)
      ..close();

    // Leaf
    final leaf = Path()
      ..moveTo(12.5, 3.0)
      ..cubicTo(13.6, 1.6, 15.1, 0.7, 16.5, 0.3)
      ..cubicTo(16.7, 1.8, 16.1, 3.3, 15.0, 4.5)
      ..cubicTo(13.9, 5.7, 12.5, 6.6, 11.0, 6.4)
      ..cubicTo(10.8, 4.9, 11.4, 3.4, 12.5, 3.0)
      ..close();

    canvas.drawPath(path, applePaint);
    canvas.drawPath(leaf, applePaint);
  }

  @override
  bool shouldRepaint(covariant _ApplePainter oldDelegate) =>
      oldDelegate.color != color;
}
