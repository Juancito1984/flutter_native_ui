import 'package:flutter/material.dart';

/// Icono vectorial de PayPal.
class PayPalIcon extends StatelessWidget {
  final double size;

  const PayPalIcon({
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
        painter: const _PayPalIconPainter(),
      ),
    );
  }
}

class _PayPalIconPainter extends CustomPainter {
  const _PayPalIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final darkBluePaint = Paint()
      ..color = const Color(0xFF003087)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final lightBluePaint = Paint()
      ..color = const Color(0xFF0079C1)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Dark P (Back)
    final p1 = Path()
      ..moveTo(6.8, 3.5)
      ..lineTo(12.5, 3.5)
      ..cubicTo(15.2, 3.5, 17.0, 4.8, 16.5, 7.8)
      ..cubicTo(16.0, 10.8, 13.8, 12.8, 11.2, 12.8)
      ..lineTo(9.2, 12.8)
      ..lineTo(7.8, 20.5)
      ..lineTo(5.2, 20.5)
      ..close();
    canvas.drawPath(p1, darkBluePaint);

    // Light P (Front Overlap)
    final p2 = Path()
      ..moveTo(9.8, 6.8)
      ..lineTo(15.5, 6.8)
      ..cubicTo(18.2, 6.8, 20.0, 8.1, 19.5, 11.1)
      ..cubicTo(19.0, 14.1, 16.8, 16.1, 14.2, 16.1)
      ..lineTo(12.2, 16.1)
      ..lineTo(10.8, 23.5)
      ..lineTo(8.2, 23.5)
      ..close();
    canvas.drawPath(p2, lightBluePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
