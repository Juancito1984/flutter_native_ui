import 'package:flutter/material.dart';

/// Icono vectorial oficial de TikTok.
class TikTokIcon extends StatelessWidget {
  final double size;

  const TikTokIcon({
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
        painter: const _TikTokIconPainter(),
      ),
    );
  }
}

class _TikTokIconPainter extends CustomPainter {
  const _TikTokIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = const Color(0xFF010101)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(0, 0, 24, 24),
        const Radius.circular(5),
      ),
      bgPaint,
    );

    // Cyan cyan/blue layer
    final cyanPaint = Paint()
      ..color = const Color(0xFF00F2FE)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path()
      ..moveTo(12.5, 3.0)
      ..lineTo(12.5, 13.5)
      ..cubicTo(12.5, 16.0, 10.5, 18.0, 8.0, 18.0)
      ..cubicTo(5.5, 18.0, 3.5, 16.0, 3.5, 13.5)
      ..cubicTo(3.5, 11.0, 5.5, 9.0, 8.0, 9.0)
      ..lineTo(8.0, 11.5)
      ..cubicTo(6.9, 11.5, 6.0, 12.4, 6.0, 13.5)
      ..cubicTo(6.0, 14.6, 6.9, 15.5, 8.0, 15.5)
      ..cubicTo(9.1, 15.5, 10.0, 14.6, 10.0, 13.5)
      ..lineTo(10.0, 3.0)
      ..lineTo(12.5, 3.0)
      ..cubicTo(12.5, 5.5, 14.5, 7.5, 17.0, 7.5)
      ..lineTo(17.0, 5.0)
      ..cubicTo(15.2, 5.0, 13.7, 3.9, 13.1, 2.5)
      ..close();

    canvas.save();
    canvas.translate(-0.6, 0.4);
    canvas.drawPath(path, cyanPaint);
    canvas.restore();

    canvas.drawPath(path, whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
