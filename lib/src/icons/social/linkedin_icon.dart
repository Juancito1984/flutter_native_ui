import 'package:flutter/material.dart';

/// Icono vectorial oficial de LinkedIn.
class LinkedInIcon extends StatelessWidget {
  final double size;
  final Color backgroundColor;

  const LinkedInIcon({
    super.key,
    this.size = 24.0,
    this.backgroundColor = const Color(0xFF0A66C2),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _LinkedInIconPainter(bgColor: backgroundColor),
      ),
    );
  }
}

class _LinkedInIconPainter extends CustomPainter {
  final Color bgColor;

  const _LinkedInIconPainter({required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final bgRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(0, 0, 24, 24),
      const Radius.circular(4),
    );
    canvas.drawRRect(bgRRect, bgPaint);

    final whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // "i"
    canvas.drawRect(const Rect.fromLTWH(3.5, 9.5, 3.4, 10.5), whitePaint);
    canvas.drawCircle(const Offset(5.2, 5.8), 2.0, whitePaint);

    // "n"
    final nPath = Path()
      ..moveTo(10.2, 9.5)
      ..lineTo(13.4, 9.5)
      ..lineTo(13.4, 11.0)
      ..cubicTo(14.0, 9.9, 15.3, 9.2, 17.0, 9.2)
      ..cubicTo(19.8, 9.2, 20.8, 11.0, 20.8, 14.5)
      ..lineTo(20.8, 20.0)
      ..lineTo(17.4, 20.0)
      ..lineTo(17.4, 15.0)
      ..cubicTo(17.4, 13.5, 17.0, 12.3, 15.4, 12.3)
      ..cubicTo(13.8, 12.3, 13.6, 13.5, 13.6, 14.9)
      ..lineTo(13.6, 20.0)
      ..lineTo(10.2, 20.0)
      ..close();

    canvas.drawPath(nPath, whitePaint);
  }

  @override
  bool shouldRepaint(covariant _LinkedInIconPainter oldDelegate) =>
      oldDelegate.bgColor != bgColor;
}
