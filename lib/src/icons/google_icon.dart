import 'package:flutter/material.dart';

/// Icono vectorial oficial de Google ("G" de 4 colores).
class GoogleIcon extends StatelessWidget {
  final double size;

  const GoogleIcon({
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
        painter: const _GoogleIconPainter(),
      ),
    );
  }
}

class _GoogleIconPainter extends CustomPainter {
  const _GoogleIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale, scale);

    // Red Path (#EA4335)
    final redPaint = Paint()
      ..color = const Color(0xFFEA4335)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final redPath = Path()
      ..moveTo(12.0, 4.75)
      ..cubicTo(13.77, 4.75, 15.35, 5.36, 16.60, 6.55)
      ..lineTo(20.02, 3.13)
      ..cubicTo(17.95, 1.19, 15.20, 0.0, 12.0, 0.0)
      ..cubicTo(7.39, 0.0, 3.44, 2.62, 1.56, 6.44)
      ..lineTo(5.58, 9.56)
      ..cubicTo(6.53, 6.64, 8.98, 4.75, 12.0, 4.75)
      ..close();
    canvas.drawPath(redPath, redPaint);

    // Yellow Path (#FBBC05)
    final yellowPaint = Paint()
      ..color = const Color(0xFFFBBC05)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final yellowPath = Path()
      ..moveTo(5.58, 14.44)
      ..cubicTo(5.33, 13.69, 5.19, 12.88, 5.19, 12.0)
      ..cubicTo(5.19, 11.12, 5.33, 10.31, 5.58, 9.56)
      ..lineTo(1.56, 6.44)
      ..cubicTo(0.56, 8.43, 0.0, 10.66, 0.0, 12.0)
      ..cubicTo(0.0, 13.34, 0.56, 15.57, 1.56, 17.56)
      ..lineTo(5.58, 14.44)
      ..close();
    canvas.drawPath(yellowPath, yellowPaint);

    // Green Path (#34A853)
    final greenPaint = Paint()
      ..color = const Color(0xFF34A853)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final greenPath = Path()
      ..moveTo(12.0, 24.0)
      ..cubicTo(15.24, 24.0, 17.95, 22.92, 19.93, 21.09)
      ..lineTo(16.06, 18.09)
      ..cubicTo(14.99, 18.86, 13.62, 19.25, 12.0, 19.25)
      ..cubicTo(8.98, 19.25, 6.53, 17.36, 5.58, 14.44)
      ..lineTo(1.56, 17.56)
      ..cubicTo(3.44, 21.38, 7.39, 24.0, 12.0, 24.0)
      ..close();
    canvas.drawPath(greenPath, greenPaint);

    // Blue Path (#4285F4)
    final bluePaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final bluePath = Path()
      ..moveTo(23.49, 12.28)
      ..cubicTo(23.49, 11.43, 23.41, 10.60, 23.27, 9.80)
      ..lineTo(12.0, 9.80)
      ..lineTo(12.0, 14.49)
      ..lineTo(18.44, 14.49)
      ..cubicTo(18.16, 15.98, 17.32, 17.25, 16.05, 18.10)
      ..lineTo(19.92, 21.10)
      ..cubicTo(22.18, 19.01, 23.49, 15.93, 23.49, 12.28)
      ..close();
    canvas.drawPath(bluePath, bluePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
