import 'package:flutter/material.dart';

/// Icono vectorial de libro abierto.
class BookOpenIcon extends StatelessWidget {
  final double size;
  final Color pageColor;

  const BookOpenIcon({
    super.key,
    this.size = 24.0,
    this.pageColor = const Color(0xFF1E88E5),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _BookOpenPainter(pageColor: pageColor),
      ),
    );
  }
}

class _BookOpenPainter extends CustomPainter {
  final Color pageColor;

  const _BookOpenPainter({required this.pageColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final linePaint = Paint()
      ..color = pageColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    // Left Page
    final leftPath = Path()
      ..moveTo(12, 6)
      ..cubicTo(9, 4, 4, 5, 2, 6)
      ..lineTo(2, 19)
      ..cubicTo(4, 18, 9, 17, 12, 19)
      ..close();
    canvas.drawPath(leftPath, linePaint);

    // Right Page
    final rightPath = Path()
      ..moveTo(12, 6)
      ..cubicTo(15, 4, 20, 5, 22, 6)
      ..lineTo(22, 19)
      ..cubicTo(20, 18, 15, 17, 12, 19)
      ..close();
    canvas.drawPath(rightPath, linePaint);
  }

  @override
  bool shouldRepaint(covariant _BookOpenPainter oldDelegate) =>
      oldDelegate.pageColor != pageColor;
}
