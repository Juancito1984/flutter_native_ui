import 'package:flutter/material.dart';

/// Icono vectorial oficial de Facebook.
class FacebookIcon extends StatelessWidget {
  final double size;
  final Color backgroundColor;

  const FacebookIcon({
    super.key,
    this.size = 24.0,
    this.backgroundColor = const Color(0xFF1877F2),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _FacebookIconPainter(bgColor: backgroundColor),
      ),
    );
  }
}

class _FacebookIconPainter extends CustomPainter {
  final Color bgColor;

  const _FacebookIconPainter({required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    final bgPaint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawCircle(const Offset(12, 12), 12, bgPaint);

    final fPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final fPath = Path()
      ..moveTo(15.416, 22.385)
      ..lineTo(15.416, 14.379)
      ..lineTo(18.105, 14.379)
      ..lineTo(18.508, 11.256)
      ..lineTo(15.416, 11.256)
      ..lineTo(15.416, 9.26)
      ..cubicTo(15.416, 8.356, 15.667, 7.74, 16.964, 7.74)
      ..lineTo(18.618, 7.74)
      ..lineTo(18.618, 4.945)
      ..cubicTo(18.332, 4.907, 17.351, 4.822, 16.210, 4.822)
      ..cubicTo(13.827, 4.822, 12.196, 6.277, 12.196, 8.948)
      ..lineTo(12.196, 11.256)
      ..lineTo(9.593, 11.256)
      ..lineTo(9.593, 14.379)
      ..lineTo(12.196, 14.379)
      ..lineTo(12.196, 22.385)
      ..close();

    canvas.drawPath(fPath, fPaint);
  }

  @override
  bool shouldRepaint(covariant _FacebookIconPainter oldDelegate) =>
      oldDelegate.bgColor != bgColor;
}
