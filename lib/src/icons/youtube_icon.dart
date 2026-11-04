import 'package:flutter/material.dart';

/// Icono vectorial oficial de YouTube.
class YouTubeIcon extends StatelessWidget {
  final double size;

  const YouTubeIcon({
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
        painter: const _YouTubeIconPainter(),
      ),
    );
  }
}

class _YouTubeIconPainter extends CustomPainter {
  const _YouTubeIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = const Color(0xFFFF0000)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final bgPath = Path()
      ..moveTo(23.5, 6.2)
      ..cubicTo(23.2, 5.1, 22.4, 4.3, 21.3, 4.0)
      ..cubicTo(19.4, 3.5, 12.0, 3.5, 12.0, 3.5)
      ..cubicTo(12.0, 3.5, 4.6, 3.5, 2.7, 4.0)
      ..cubicTo(1.6, 4.3, 0.8, 5.1, 0.5, 6.2)
      ..cubicTo(0.0, 8.1, 0.0, 12.0, 0.0, 12.0)
      ..cubicTo(0.0, 12.0, 0.0, 15.9, 0.5, 17.8)
      ..cubicTo(0.8, 18.9, 1.6, 19.7, 2.7, 20.0)
      ..cubicTo(4.6, 20.5, 12.0, 20.5, 12.0, 20.5)
      ..cubicTo(12.0, 20.5, 19.4, 20.5, 21.3, 20.0)
      ..cubicTo(22.4, 19.7, 23.2, 18.9, 23.5, 17.8)
      ..cubicTo(24.0, 15.9, 24.0, 12.0, 24.0, 12.0)
      ..cubicTo(24.0, 12.0, 24.0, 8.1, 23.5, 6.2)
      ..close();

    canvas.drawPath(bgPath, bgPaint);

    final playPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final playPath = Path()
      ..moveTo(9.6, 15.5)
      ..lineTo(15.8, 12.0)
      ..lineTo(9.6, 8.5)
      ..close();

    canvas.drawPath(playPath, playPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
